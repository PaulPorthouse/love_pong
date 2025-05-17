
function containsKey(container, key)
    if #container == 0 then
        -- no length, so assuming a table
        for k, v in pairs(container) do
            if k == key then
                return true
            end
        end
    end

    return false
end

function containsValue(container, value)
    if #container == 0 then
        -- no length, so assuming a table
        for k, v in pairs(container) do
            if (k == key or nil) and (v == value) then
                return true
            end
        end
    else
        -- has a length, so must be an array
        for _, v in ipairs(container) do
            if v == value then
                return true
            end
        end
    end

    return false
end

function containsKeyValue(container, key, value)
    if #container == 0 then
        -- no length, so assuming a table
        for k, v in pairs(container) do
            if ((k == key) and (v == value)) then
                return true
            end
        end
    end

    return false
end

function indexOf(array, value)
    for k, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    return nil
end

function arrayRemove(t, value)
    local j, n = 1, #t;

    for i=1,n do
        if (t[i] ~= value) then
            -- Move i's kept value to j's position, if it's not already there.
            if (i ~= j) then
                t[j] = t[i];
                t[i] = nil;
            end
            j = j + 1; -- Increment position of where we'll place the next kept value.
        else
            t[i] = nil;
        end
    end

    return t;
end