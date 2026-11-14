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

function searchRelevancy(searchString, sourceString)
    local colon = sourceString:find(":", 1, true)
    local shortName = sourceString:sub(colon + 1)

    if string.sub(searchString, 1, string.len(searchString)) == string.sub(shortName, 1, string.len(searchString)) then
        return 1 + string.len(searchString) / string.len(shortName)
    elseif shortName:find(searchString, 1, true) then
        return string.len(searchString) / string.len(shortName)
    else
        return -1
    end
end

function rankedComparator(a, b)
    return a.rank > b.rank
end

function sortByRank(searchString, stockTable)
    local sortedRankedTable = {}
    for k, v in ipairs(stockTable) do
        table.insert(sortedRankedTable,
            { ["name"] = v.name, ["rank"] = searchRelevancy(searchString, v.name), ["stock"] = v.count })
    end
    table.sort(sortedRankedTable, rankedComparator)
    return sortedRankedTable
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
            return sortByRank(normalizedSearch, tempTable)
        else
            print("Please enter a valid search.")
        end
    else
        print("Please enter a valid search.")
    end
end

return frogSearch
