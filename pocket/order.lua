local frogSearch = require("lib.item_search")
local frogList = require("getList")
local warehouseID = 10
local args = { ... }
local userItem = table.concat(args, " ", 2)
local userTable = { ["_requestCount"] = args[1], ["name"] = userItem }
local stockData = {}
local selectedItem = nil


rednet.open("back")

function normalizeUserInput(table)
    table.name = string.gsub(table.name, '^%s*(.-)%s*$', '%1')
    table.name = string.lower(table.name)
    table._requestCount = tonumber(table._requestCount)
end

function validateUserInput(table)
    local maxItemCount = 256


    if type(table._requestCount) ~= "number" then
        return false
    end
    if table._requestCount % 1 ~= 0 then
        return false
    end
    if table._requestCount <= 0 then
        return false
    end
    if table._requestCount > maxItemCount then
        return false
    end
    if type(table.name) ~= "string" then
        return false
    end
    if string.len(table.name) <= 0 then
        return false
    end
    return true
end

function validateStockLevel(stockCount, userRequest)
    local stockNum = tonumber(stockCount)
    if stockNum < userRequest then
        return false
    end
    return true
end

function handleItemSelection(userSelection, itemTable)
    print(("Frog OS - Search : %s"):format(userSelection))
    for index, item in ipairs(itemTable) do
        print(("%d: %s"):format(index, item.name))
        if index == 6 then
            break
        end
        local userSelection = read("Selection: ")
        print(("You selected %s!"):format(userSelection))
    end
end

function generateRequest()
    normalizeUserInput(userTable)
    if validateUserInput(userTable) == false then
        return print("Malformed item request, please resubmit")
    else
        stockData = frogSearch.parse(userTable.name, frogList.getStock())
        if #stockData == 1 then
            selectedItem = stockData[1]
        else
            return print("Multiple matches not found, NYI")
        end
        if selectedItem then
            if validateStockLevel(selectedItem.stock, userTable["_requestCount"]) then
                sendOrder(warehouseID, selectedItem.name, userTable["_requestCount"])
            else
                print("FrogOS: Insufficient stock!")
                print(("Current stock of %s: %d"):format(
                    selectedItem.name,
                    selectedItem.stock
                ))
                print(("Requested amount: %s"):format(userTable["_requestCount"]))
            end
        end
    end
end

function sendOrder(target, payloadName, payloadAmount)
    rednet.send(target,
        {
            ["action"] = "order",
            ["item"] = payloadName,
            ["count"] = payloadAmount
        })
end

generateRequest()
