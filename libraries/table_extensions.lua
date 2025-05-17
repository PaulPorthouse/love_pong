
function table.getKeys(table)
    local keys = {}

    for k,v in pairs(table) do
        keys[#keys+1] = k
    end

    return keys
end

function table.containsKey(table, key)
    for k,v in pairs(table) do
        if k == key then
            return true
        end
    end

    return false
end