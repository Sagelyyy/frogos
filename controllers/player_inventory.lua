local stockTicker = peripheral.find("Create_StockTicker")

local test = {
    action = "request",
    item = "create:shaft",
    count = 64
}

stockTicker.requestFiltered("chris_inventory", { name = "create:shaft", _requestCount = 64 })
