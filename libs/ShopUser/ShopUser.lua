-- v 0.0.0.1
-- ShopUser class
ShopUser = {} -- ShopUser = require("ShopUser") shopUser = ShopUser:new("lolo")

ShopItem = require("ShopProxy/ShopItem")
ApiCommunicator = require("ApiCommunicator")
LuaHelper = require("LuaHelper")
json = require("json")

ShopUserState = {
    NotRegistered = 1, -- ask email
    PinNotEntered = 2, -- ask pin
    Ok = 3, -- you can make operations
    Unknown = 4, -- do first step
    OtherSessionExists = 5 -- Session on backend already exists
}

local debugmode = true
function ShopUser:new(userName)
    local obj = {}
    obj.Balance = nil
    obj.IsUpToDate = false
    obj.Name = userName
    -- obj.Hash = userHash TODO??
    obj.Basket = nil -- array of user items which are not being sold (deposited or bought)
    obj.BeingSoldItems = nil -- array of user items which are being sold
    obj.apiCommunicator = ApiCommunicator:new(userName)
    obj.ShopUserState = ShopUserState.Unknown
    obj.SessionId = ""

    function obj:GetState()
        if (self.ShopUserState == ShopUserState.Ok) then
            return ShopUserState.Ok --We know that is ok, in other case we need ask BackEnd
        end
        local apiCallRawResult = self.apiCommunicator:GetUser()
        local parsedJson = json.decode(apiCallRawResult)
        if (parsedJson["key"] == true) then
            self.SessionId = parsedJson["info"]
            self.ShopUserState = ShopUserState.Ok
            return ShopUserState.Ok
        end
        if (parsedJson["key"] == false) then
            if (parsedJson["info"] == "user") then
                self.ShopUserState = ShopUserState.NotRegistered
                return ShopUserState.NotRegistered
            end
            if (parsedJson["info"] == "status") then
                self.ShopUserState = ShopUserState.PinNotEntered
                return ShopUserState.PinNotEntered
            end
            if (parsedJson["info"] == "online") then
                return ShopUserState.OtherSessionExists
            end
        end
        LuaHelper.PrintIfDebug("Unknown APi response", apiCallRawResult)

    end

    -- returns false if mail was not set, ask user provide email again
    function obj:SetEmail(email)
        local apiCallRawResult = self.apiCommunicator:SetMail(email)
        local parsedJson = json.decode(apiCallRawResult)

        if (not parsedJson["key"]) then
            return false
        elseif (parsedJson["key"]) then
            self.ShopUserState = ShopUserState.PinNotEntered
            LuaHelper.PrintIfDebug("SetEmail for " .. self.apiCommunicator.PlayerName .. " Ok")
            return true
        end
    end

    -- returns false if something went wrong
    function obj:SetPin(pin)
        local apiCallRawResult = self.apiCommunicator:SetPin(pin)
        local parsedJson = json.decode(apiCallRawResult)
        if (parsedJson["key"]) then
            self:GetState()
            LuaHelper.PrintIfDebug("SetPin for " .. self.apiCommunicator.PlayerName .. " Ok")
            return true
        end
        LuaHelper.PrintIfDebug("SetPin for " .. self.apiCommunicator.PlayerName .. " Bad", apiCallRawResult)
        return false
    end

    -- scan chest take only emeralds
    -- function returns amount of successfully deposited emeralds nil if any error
    function obj:UpBalance()
        if (debugmode) then
            print("user:" .. self.Name .. "UpBalance start")
        end
        -- TODO
        --
    end

    -- user wants to buy offer
    -- function returns true or reason why deal failed
    function obj:Buy(shopItemId, amount)
        -- TODO call to BackEnd
    end

    -- Give user item to chest from Basket
    function obj:GiveOutIem(ItemId, amount)
        -- TODO
        -- LockOtherUserOperations
        -- CallApi
        -- PutToChest
        -- CallApi
    end

    -- User finished (the user did his thing and walked away)
    function obj:VisitEnd()
        self.Balance = nil
        self.IsUpToDate = false
        self.Name = nil
        self.Hash = nil
        self.Basket = nil -- array of user items which are not being sold (deposited or bought)
        self.BeingSoldItems = nil -- array of user items which are being sold
        obj.ShopUserState = ShopUserState.Unknown
        self.apiCommunicator:LogOut()
    end

    setmetatable(obj, self)
    self.__index = self;
    return obj
end

return ShopUser

user = ShopUser:new('ReiVanSTR')

function auth(nick)
    user = ShopUser:new(nick)
end    
