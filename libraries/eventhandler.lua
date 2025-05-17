EventHandler = Object:extend()

function EventHandler:new()
    self.events = {}
end

function EventHandler:add(eventName)
    if not self.events[eventName] then
        self.events[eventName] = {}
    end
end

function EventHandler:remove(eventName)
    if self.events[eventName] then
        table.remove(self.events, eventName)
    end
end

function EventHandler:subscribe(eventName, callback)
    if not self.events[eventName] then
        self:add(eventName)
    end
    if type(callback) == "function" then
        table.insert(self.events[eventName], { callback, nil })
    else
        table.insert(self.events[eventName], callback)
    end
end

function EventHandler:unsubscribe(eventName, callback)
    if self.events[eventName] then
        table.remove(self.events[eventName], callback)
    end
end

function EventHandler:emit(eventName, ...)
    local callbacks = self.events[eventName]
    if #callbacks == 0 then
        return
    end

    for _, callback in ipairs(callbacks) do
        if callback[2] then
            callback[1](callback[2], ...)
        else
            callback[1](...)
        end
    end
end

return EventHandler()