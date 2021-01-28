-- v 0.0.0.2
ApiCommunicator = {} -- ApiCommunicator = require("ApiCommunicator")    apiCommunicator=ApiCommunicator:new()

LuaHelper = require("LuaHelper")
ApiCommunicator.ComputerToken = "qwer234fjhg4521hdfht1"

local debugmode = true
function ApiCommunicator:new(playerName)
    -- свойства
    local obj = {}
    obj.Url = "http://api.cu41957.tmweb.ru" -- TODO from config
    obj.Server = "ht1" -- TODO from config or not needed
    obj.UserToken = ""
    obj.PlayerName = "lolo"
    if (playerName ~= nil) then
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

    function obj:GetAllUsersItems()
        return self:MakeRequest(self.Url .. "/storage/get")
    end

    function obj:GetUserProperties()
        return self:MakeRequest(self.Url .. "/user/get/user")
    end

    function obj:PushItem(fPrint)
        return self:MakeRequest(self.Url .. "/storage/push", fPrint)
    end

    function obj:UpdateUser(body)
        return self:MakeRequest(self.Url .. "/user/update", body)
    end

    -- returns raw response from api
    function obj:MakeRequest(url, body)
        body = body or ''
        local internet = require("internet")
        local headers = {
            ["content-type"] = "application/json",
            ["user-agent"] = "Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36",
            ["computer-access-token"] = ApiCommunicator.ComputerToken,
            ["user-access-token"] = self.UserToken
        }

        if debugmode then
            LuaHelper.PrintIfDebug("Making call")
            LuaHelper.PrintObj(headers)
        end
        local req = internet.request(url, body, headers)
        local result = ""
        for line in req do
            result = result .. line
        end
        LuaHelper.PrintIfDebug("Making call"..url.." Ok", result)
        return result
    end

    setmetatable(obj, self)
    self.__index = self;
    return obj
end

return ApiCommunicator
