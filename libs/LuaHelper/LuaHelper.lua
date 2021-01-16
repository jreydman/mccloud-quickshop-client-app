-- v 0.0.0.1
LuaHelper = {} -- LuaHelper = require("LuaHelper")

function LuaHelper.ManyToString(...)
    local result = ""
    for i, v in ipairs {...} do
        result = result .. tostring(v) .. '\n'
    end
    return result
end

function LuaHelper.PrintObj(obj, hierarchyLevel)
    if (hierarchyLevel == nil) then
        hierarchyLevel = 0
    elseif (hierarchyLevel == 4) then
        return 0
    end

    local whitespace = ""
    for i = 0, hierarchyLevel, 1 do
        whitespace = whitespace .. "-"
    end
    io.write(whitespace)

    print(obj)
    if (type(obj) == "table") then
        for k, v in pairs(obj) do
            io.write(whitespace .. "-")
            if (type(v) == "table") then
                printObj(v, hierarchyLevel + 1)
            else
                print(v)
            end
        end
    else
        print(obj)
    end
end

return LuaHelper
