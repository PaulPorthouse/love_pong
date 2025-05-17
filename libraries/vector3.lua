Vector3 = Object:extend()

function Vector3:new(x, y, z)
    self.x = x or 0
    self.y = y or 0
    self.z = z or 0
end

function Vector3:add(other)
    self.x = self.x + other.x
    self.y = self.y + other.y
    self.z = self.z + other.z
end

function Vector3:subtract(other)
    self.x = self.x - other.x
    self.y = self.y - other.y
    self.z = self.z - other.z
end

function Vector3:multiply(scalarX, scalarY, scalarZ)
    self.x = self.x * (scalarX or 1)
    self.y = self.y * (scalarY or scalarX or 1)
    self.z = self.z * (scalarZ or scalarY or scalarX or 1)
end

function Vector3:divide(scalarX, scalarY, scalarZ)
    self.x = self.x / (scalarX or 1)
    self.y = self.y / (scalarY or scalarX or 1)
    self.z = self.z / (scalarZ or scalarY or scalarX or 1)
end

function Vector3:dot(other)
    return self.x * other.x + self.y * other.y + self.z * other.z
end

function Vector3:normalize()
    local length = math.sqrt(self.x^2 + self.y^2 + self.z^2)
    if length > 0 then
        self.x = self.x / length
        self.y = self.y / length
        self.z = self.z / length
    end
end

function Vector3:cross(other)
    return Vector3(
        self.y * other.z - self.z * other.y,
        self.z * other.x - self.x * other.z,
        self.x * other.y - self.y * other.x
    )
end

function Vector3:length()
    return math.sqrt(self.x^2 + self.y^2 + self.z^2)
end

function Vector3:distance(other)
    return math.sqrt((self.x - other.x)^2 + (self.y - other.y)^2 + (self.z - other.z)^2)
end

function Vector3:angle(other)
    local dotProduct = self:dot(other)
    local lengths = self:length() * other:length()
    if lengths == 0 then return 0 end
    return math.acos(dotProduct / lengths)
end

function Vector3:copy()
    return Vector3(self.x, self.y, self.z)
end

function Vector3:projectOnto(other)
    local dotProduct = self:dot(other)
    local otherLengthSquared = other:length()^2
    if otherLengthSquared == 0 then return Vector3(0, 0, 0) end
    local scalar = dotProduct / otherLengthSquared
    return Vector3(other.x * scalar, other.y * scalar, other.z * scalar)
end

function Vector3:project(other)
    local dotProduct = self:dot(other)
    local otherLengthSquared = other:length()^2
    if otherLengthSquared == 0 then return Vector3(0, 0, 0) end
    local scalar = dotProduct / otherLengthSquared
    return Vector3(other.x * scalar, other.y * scalar, other.z * scalar)
end

function Vector3:__tostring()
    return "(" .. (self.x or 0) .. ", " .. (self.y or 0) .. ", " .. (self.z or 0) .. ")"
end