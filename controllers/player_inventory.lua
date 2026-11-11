local stockTicker = peripheral.find("Create_StockTicker")
local playerAddress = "chris_inventory"


local testItem = {
    action = "request",
    item = "create:shaft",
    count = 64
}

local id, payload = rednet.receive()

print(("Computer %d sent a a payload of:\n%s"):format(id, payload))

if payload then
    stockTicker.requestFiltered(playerAddress, {
        name = testItem.item,
        _requestCount = testItem.count,

    })
end
-- stockTicker.requestFiltered("chris_inventory", { name = "create:shaft", _requestCount = 64 })
