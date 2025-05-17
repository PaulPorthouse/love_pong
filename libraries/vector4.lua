Vector4 = Object:extend()

function Vector4:new(x, y, z, w)
    self.x = x or 0
    self.y = y or 0
    self.z = z or 0
    self.w = w or 0
end

function Vector4:add(other)
    self.x = self.x + other.x
    self.y = self.y + other.y
    self.z = self.z + other.z
    self.w = self.w + other.w
end

function Vector4:subtract(other)
    self.x = self.x - other.x
    self.y = self.y - other.y
    self.z = self.z - other.z
    self.w = self.w - other.w
end

function Vector4:multiply(scalarX, scalarY, scalarZ, scalarW)
    self.x = self.x * (scalarX or 1)
    self.y = self.y * (scalarY or scalarX or 1)
    self.z = self.z * (scalarZ or scalarY or scalarX or 1)
    self.w = self.w * (scalarW or scalarZ or scalarY or scalarX or 1)
end

function Vector4:divide(scalarX, scalarY, scalarZ, scalarW)
    self.x = self.x / (scalarX or 1)
    self.y = self.y / (scalarY or scalarX or 1)
    self.z = self.z / (scalarZ or scalarY or scalarX or 1)
    self.w = self.w / (scalarW or scalarZ or scalarY or scalarX or 1)
end

function Vector4:dot(other)
    return self.x * other.x + self.y * other.y + self.z * other.z + self.w * other.w
end

function Vector4:normalize()
    local length = math.sqrt(self.x^2 + self.y^2 + self.z^2 + self.w^2)
    if length > 0 then
        self.x = self.x / length
        self.y = self.y / length
        self.z = self.z / length
        self.w = self.w / length
    end
end

function Vector4:length()
    return math.sqrt(self.x^2 + self.y^2 + self.z^2 + self.w^2)
end

function Vector4:distance(other)
    return math.sqrt((self.x - other.x)^2 + (self.y - other.y)^2 + (self.z - other.z)^2 + (self.w - other.w)^2)
end

function Vector4:__tostring()
    return "(" .. (self.x or 0) .. ", " .. (self.y or 0) .. ", " .. (self.z or 0) .. ", " .. (self.w or 0) .. ")"
end