Vector2 = Object:extend()

function Vector2:new(x, y, z)
    self.x = x or 0
    self.y = y or 0
end

function Vector2:add(other)
    if other:is(Vector2) then
        self.x = self.x + other.x
        self.y = self.y + other.y
        return
    end
    self.x = self.x + other.x
    self.y = self.y + other.y
end

function Vector2:subtract(other)
    if other:is(Vector2) then
        self.x = self.x - other.x
        self.y = self.y - other.y
        return
    end
    self.x = self.x - other.x
    self.y = self.y - other.y
end

function Vector2:multiply(scalarX, scalarY)
    if (type(scalarX) == "number") then
        self.x = self.x * scalarX
        self.y = self.y * (scalarY or scalarX)
        return
    end

    self.x = self.x * scalarX.x
    self.y = self.y * scalarX.y
    return
end

function Vector2:divide(scalarX, scalarY)
    if scalarX:is(Vector2) then
        self.x = self.x / scalarX.x
        self.y = self.y / scalarX.y
        return
    end
    self.x = self.x / (scalarX or 1)
    self.y = self.y / (scalarY or scalarX or 1)
end

function Vector2:dot(other)
    return self.x * other.x + self.y * other.y
end

function Vector2:normalize()
    local length = math.sqrt(self.x^2 + self.y^2)
    if length > 0 then
        self.x = self.x / length
        self.y = self.y / length
    end
end

function Vector2:cross(other)
    return Vector2(
        self.y * other.z - self.z * other.y,
        self.z * other.x - self.x * other.z,
        self.x * other.y - self.y * other.x
    )
end

function Vector2:length()
    return math.sqrt(self.x^2 + self.y^2)
end

function Vector2:distance(other)
    return math.sqrt((self.x - other.x)^2 + (self.y - other.y)^2)
end

function Vector2:angle(other)
    local dotProduct = self:dot(other)
    local lengths = self:length() * other:length()
    if lengths == 0 then return 0 end
    return math.acos(dotProduct / lengths)
end

function Vector2:copy()
    return Vector2(self.x, self.y)
end

function Vector2:__tostring()
    return "(" .. (self.x or 0) .. ", " .. (self.y or 0) .. ")"
end