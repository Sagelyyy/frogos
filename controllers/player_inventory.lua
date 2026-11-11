local stockTicker = peripheral.find("Create_StockTicker")
local playerAddress = "chris_inventory"
local pocketID = 11

rednet.open("right")


while true do
    local id, payload = rednet.receive()
    if id == pocketID then
        print(("Computer %d sent a a payload of:\n%s"):format(id, payload))
        if payload then
            if payload == "list" then
                local vaultInventory = stockTicker.stock()
                rednet.send(pocketID, vaultInventory)
            end
        elseif payload ~= "list" then
            print(textutils.serialise(payload))
            stockTicker.requestFiltered(playerAddress, {
                name = payload.item,
                _requestCount = payload.count,

            })
        end
    else
        print(("Received invalid request from %d: \n%s"):format(id, payload))
    end
end
