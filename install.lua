local currentId = os.getComputerID()

if currentId == 10 then
    shell.run("rm", "stockInventory.lua")
    shell.run("wget",
        "https://raw.githubusercontent.com/Sagelyyy/frogos/main/controllers/stockInventory.lua", "stockInventory.lua")
elseif currentId == 11 then
    shell.run("rm", "order.lua")
    shell.run("rm", "lib/item_search.lua")
    shell.run("rm", "getList.lua")
    shell.run("mkdir", "lib")

    shell.run("wget", "https://raw.githubusercontent.com/Sagelyyy/frogos/main/pocket/getList.lua", "getList.lua")
    shell.run("wget", "https://raw.githubusercontent.com/Sagelyyy/frogos/main/pocket/order.lua", "order.lua")
    shell.run("wget",
        "https://raw.githubusercontent.com/Sagelyyy/frogos/main/lib/item_search.lua", "lib/item_search.lua")
end
