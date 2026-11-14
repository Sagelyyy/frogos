local frogSearch = require("lib.item_search")
local frogList = require("getList")
rednet.open("back")
local args = { ... }
--
-- rednet.send(10, { ["item"] = item, ["count"] = quantity })

local item = table.concat(args, " ", 2)
local stockData = frogSearch.parse(item, frogList.getStock())
-- print(textutils.pagedPrint(textutils.serialise(stockData)))

if stockData ~= nil then
    if #stockData == 1 then
        if tonumber(stockData[1].stock) < tonumber(args[1]) then
            print("FrogOS: Insufficient stock!")
            print(("Current stock of %s: %d"):format(
                stockData[1].name,
                tostring(stockData[1].stock)
            ))
            print(("Requested amount: %s"):format(args[1]))
        else
            rednet.send(10, { ["item"] = stockData[1].name, ["count"] = args[1] })
            print("FrogOS: Order submitted!")
            print(("%d x %s"):format(args[1], stockData[1].name))
        end
    end
end
