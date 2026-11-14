local frogSearch = require("lib.item_search")
local frogList = require("getList")
rednet.open("back")
local args = { ... }
--
-- rednet.send(10, { ["item"] = item, ["count"] = quantity })

local item = table.concat(args, " ", 2)
local stockData = frogSearch.parse(item, frogList.getStock())
print(textutils.pagedPrint(textutils.serialise(stockData)))
