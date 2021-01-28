-- v 0.0.0.1
-- ShopProxy class for communicating  site
ShopItem = require("ShopProxy/ShopItem")

ShopProxy = {} -- ShopProxy = require("ShopProxy")

local debugged = true
function ShopProxy:new()
    -- properties
    local obj = {}
    obj.IsUpToDate = false

    -- Find in entire shop (поиск)
    -- Request to BackEnd  (we can not perform this operation on client side it is to cost...)
    function obj:FindSellingItems(str, page)
        -- TODO
        it1 = ShopItem:new()
        it1.Name = "test Item1 name"
        it2 = ShopItem:new()
        it2.Name = "test Item2 name"
        local arr = {it1, it2} 
        return arr
    end

    function obj:SellingItems(page)
        if (debugged) then
            print("SellingItems called")
        end
        -- TODO
        --
    end

    function obj:PutUpForSale(shopItem)
        if (type(shopItem) ~= "ShopItem") then
            error("PutUpForSale bad argument type")
        end
        if (debugged) then
            print("PutUpForSale called item: " .. shopItem.ToString())
        end
        shopItem.ShopItemOwnerType = ShopItemOwnerType.Shop
    end

    setmetatable(obj, self)
    self.__index = self;
    return obj
end

return ShopProxy
