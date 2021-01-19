-- v 0.0.0.1
ApiCommunicator = {} -- ApiCommunicator = require("ApiCommunicator")    apiCommunicator=ApiCommunicator:new()

LuaHelper = require("LuaHelper")

local debugmode = true
function ApiCommunicator:new(playerName)
    -- свойства
    local obj = {}
    obj.Url = "http://api.cu41957.tmweb.ru" -- TODO from config
    obj.Server = "ht1" -- TODO from config
    obj.Token = "opcHT1" -- TODO from config
    obj.PlayerName = "lolo"
    if (debugmode and playerName ~= nil) then
        obj.PlayerName = playerName
    end

    function obj:GetUser()
        return self:MakeRequest(self.Url .. "/user/valide?nickname=" .. self.PlayerName)
    end

    function obj:SetMail(email)
        return self:MakeRequest(self.Url .. "/user/reg?nickname=" .. self.PlayerName .. "&mail=" .. email)
    end

    function obj:SetPin(pin)
        return self:MakeRequest(self.Url .. "/user/reg?nickname=" .. self.PlayerName .. "&pin=" .. pin)
    end

    function obj:LogOut()
        return self:MakeRequest(self.Url .. "/user/logout?nickname=" .. self.PlayerName)
    end


    -- returns raw response from api
    function obj:MakeRequest(url)

        local internet = require("internet")
        local headers = {
            ["content-type"] = "application/json",
            ["user-agent"] = "Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36",
            ["Server"] = self.Server,
            ["token"] = self.Token
        }

        if debugmode then
            print("Making call")
            LuaHelper.PrintObj(headers)
        end
        local req = internet.request(url, '', headers)
        local result = ""
        for line in req do
            result = result .. line
        end
        if debugmode then
            print(result)
        end
        return result
    end

    setmetatable(obj, self)
    self.__index = self;
    return obj
end

return ApiCommunicator
