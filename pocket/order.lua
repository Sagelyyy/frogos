rednet.open("back")

local quantity, item = ...

rednet.send(10, { ["item"] = item, ["count"] = quantity })
