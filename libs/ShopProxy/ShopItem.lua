-- v 0.0.0.1
-- ShopItem properties of selling 1 item
ShopItem = {} -- ShopItem = require("ShopProxy/ShopItem")
LuaHelper = require("LuaHelper")

ShopItemOwnerType = {
    Shop = 1, -- Item is being sold
    User = 2, -- Item is in users stash (купил или внес но еще не выставил на продажу)
    Undefined = 3 -- test purposes etc.
}

local debugmode = true
function ShopItem:new() -- TODO construct from Json
    -- свойства
    local obj = {}
    obj.Prise = ""
    obj.Name = "" -- Item Name from mineshaft
    obj.ItemId = ""
    obj.ItemHash = ""
    obj.Seller = "" -- nickname player who sells
    obj.ShopItemOwnerType = ShopItemOwnerType.Undefined
    -- returns human readable form
    function obj:ToString()
        print("self is".. tostring(self))
        return LuaHelper.ManyToString("Prise:" .. self.Prise,"ItemId:".. self.ItemId, "  Name:" .. self.Name, "Seller:" ..self.Seller)
    end

    -- JsonStructure for BackEnd
    function obj:ToJson() -- TODO
    end

    setmetatable(obj, self)
    self.__index = self;
    return obj
end

return ShopItem
