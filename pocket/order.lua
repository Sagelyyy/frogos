local frogSearch = require("lib.item_search")
local frogList = require("getList")
rednet.open("back")
local quantity, item = ...
--
-- rednet.send(10, { ["item"] = item, ["count"] = quantity })

local stockData = frogSearch.parse(item, frogList.getStock())
print(textutils.serialise(stockData))
