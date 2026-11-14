local fakeStock = {
    { name = "minecraft:iron_ingot", count = 320 },
    { name = "create:shaft",         count = 305 },
    { name = "minecraft:stone",      count = 256 }
}

rednet = {}
local frogList = require("pocket.getList")

function rednet.open(side)
    print("Mock modem open on side: ", side)
end

function rednet.send(id, stockList)
    print("Sending data..")
    return id, stockList
end

function rednet.receive()
    return 10, fakeStock
end

local stock = frogList.getStock()

print("Items found: ", #stock)
