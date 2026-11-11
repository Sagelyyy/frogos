local stockTicker = peripheral.find("Create_StockTicker")
local playerAddress = "chris_inventory"
local pocketID = 11


local testItem = {
    action = "request",
    item = "create:shaft",
    count = 64
}

rednet.open("right")
local id, payload = rednet.receive()

if id == pocketID then
    print(("Computer %d sent a a payload of:\n%s"):format(id, payload))
    if payload then
        if payload == "list" then
            sleep(5)
            local vaultInventory = stockTicker.stock()
            rednet.send(pocketID, vaultInventory)
            return
        end
        stockTicker.requestFiltered(playerAddress, {
            name = testItem.item,
            _requestCount = testItem.count,

        })
    end
else
    print(("Received invalid request from %d: \n%s"):format(id, payload))
end
