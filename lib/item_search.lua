local testStock = {
    {
        name = "minecraft:stone",
        count = 256
    },
    {
        name = "minecraft:cobblestone",
        count = 1024
    },
    {
        name = "minecraft:stone_bricks",
        count = 128
    },
    {
        name = "minecraft:deepslate",
        count = 64
    },
    {
        name = "minecraft:iron_ingot",
        count = 320
    },
    {
        name = "create:shaft",
        count = 305
    },
    {
        name = "minecraft:brass_ingot",
        count = 503
    },
    {
        name = "minecraft:glass",
        count = 64
    }
}

local frogSearch = {}

local function searchStock(stock, normal, tempTable)
    for k, v in ipairs(stock) do
        local colon = v.name:find(":", 1, true)
        local shortName = v.name:sub(colon + 1)
        if string.find(shortName, normal, nil, true) then
            table.insert(tempTable, { ["name"] = v.name, ["stock_count"] = v.count })
        end
    end
end

function frogSearch.parse(searchString, stockTable)
    local tempTable = {}
    if type(searchString) == "string" then
        searchString = string.gsub(searchString, '^%s*(.-)%s*$', '%1')
        if string.len(searchString) > 0 then
            searchString = string.lower(searchString)
            local normalizedSearch = string.gsub(searchString, "%s", "_")
            searchStock(stockTable, normalizedSearch, tempTable)
            if #tempTable == 0 and searchString:match("s$") == "s" then
                normalizedSearch = string.gsub(normalizedSearch, "s$", "")
                searchStock(stockTable, normalizedSearch, tempTable)
            end
            return tempTable
        else
            print("Please enter a valid search.")
        end
    else
        print("Please enter a valid search.")
    end
end

return frogSearch
