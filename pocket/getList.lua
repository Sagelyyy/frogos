local frogList = {}

function frogList.getStock()
    local warehouseID = 10
    rednet.open("back")
    rednet.send(warehouseID, "list")

    local sender, data = rednet.receive(nil, 10)
    if sender ~= nil then
        if sender == warehouseID then
            if type(data) == "table" then
                if #data > 0 then
                    return data
                else
                    print("No entries found.")
                end
            else
                print("Unexpected data returned, data is not a table")
            end
        else
            print(("Invalid reply ID %d"):format(sender))
        end
    else
        print("No reply from warehouse.")
    end
end

return frogList
