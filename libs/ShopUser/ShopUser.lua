-- v 0.0.0.1
-- ShopUser class
ShopUser = {} -- ShopUser = require("ShopUser")

ShopItem = require("ShopProxy/ShopItem")

local debugmode = true
function ShopUser:new(userHash, userName)
    -- свойства
    local obj = {}
    obj.Balance = nil
    obj.IsUpToDate = false
    obj.Name = userName
    obj.Hash = userHash
    obj.Basket = nil -- array of user items which are not being sold (deposited or bought)
    obj.BeingSoldItems = nil -- array of user items which are being sold 

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
    end

    setmetatable(obj, self)
    self.__index = self;
    return obj
end

return ShopUser
