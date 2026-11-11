rednet.open("back")

local quantity, item = ...

rednet.send(item, quantity)
