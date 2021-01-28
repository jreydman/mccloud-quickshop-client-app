-- v 0.0.0.2
-- ShopItem properties of selling 1 item
ShopItem = {} -- ShopItem = require("ShopProxy/ShopItem")
LuaHelper = require("LuaHelper")
json = require("json")

ShopItemOwnerType = {
    Stash = 0, -- -- Item is in users stash (купил или внес но еще не выставил на продажу)
    Shop = 1, -- Item is being sold in shop
    Auk = 2, -- Item is being sold in Auk
    Undefined = 3 -- test purposes etc.
}

local debugmode = true
function ShopItem:new() -- TODO construct from Json
    -- свойства
    local obj = {}
    obj.Prise = ""
    obj.Count = 0
    obj.DisplayName = "" -- Item Name from mineshaft
    obj.Id = ""
    obj.F_Item = "" -- fingerprint
    obj.ItemHash = ""
    obj.OwnerUser = "" -- nickname player who sells
    obj.ShopItemOwnerType = ShopItemOwnerType.Undefined
    obj.Server = ""
    -- returns human readable form
    function obj:ToString()
        print("self is" .. tostring(self))
        return LuaHelper.ManyToString("Prise:" .. self.Prise, "ItemId:" .. self.Id,
                   "  DisplayName:" .. self.DisplayName, "OwnerUser:" .. self.OwnerUser)
    end

    -- init all properties from json got from api
    function obj:InitFromJson(jObj)
        self.Id = jObj.id
        self.OwnerUser = jObj.owner_user
        self.F_Item = jObj.f_item
        self.Count = jObj.count
        self.ItemHash = jObj.item_hash
        self.ShopItemOwnerType = jObj.owner_type
        self.Server = jObj.server
        self.DisplayName =  json.decode(self.F_Item).display_name
    end

    -- JsonStructure for BackEnd
    function obj:ToJson() -- TODO
    end

    setmetatable(obj, self)
    self.__index = self;
    return obj
end

return ShopItem
