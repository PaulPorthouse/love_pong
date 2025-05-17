Ball = Object:extend()

function Ball:new(x, y, color)
    self.x = x
    self.y = y
    self.radius = 6
    self.color = color
    self.speed = 0
    self.angle = 0
    self.started = false
    self.screenWidth, self.screenHeight = love.graphics.getDimensions()
end

function Ball:update(dt)
    if self.started ~= true then
        return
    end

    -- https://maththebeautiful.com/ball-bounce/

    local radAngle = math.rad(self.angle - 90)
    self.x = self.x + math.cos(radAngle) * self.speed * dt
    self.y = self.y + math.sin(radAngle) * self.speed * dt

    if self.x - self.radius < 0 then
        self.x = self.radius
        radAngle = math.pi - radAngle
    elseif self.x + self.radius > self.screenWidth then
        self.x = self.screenWidth - self.radius
        radAngle = math.pi - radAngle
    end

    if self.y < self.radius then
        self.y = self.radius
        radAngle = (math.pi * 2) - radAngle
    elseif self.y + self.radius > self.screenHeight then
        self.y = self.screenHeight - self.radius
        radAngle = (math.pi * 2) - radAngle
    end

    self.angle = math.deg(radAngle) + 90

end

function Ball:draw()
    local r, g, b, a = love.graphics.getColor()
    love.graphics.setColor(self.color.x, self.color.y, self.color.z, self.color.w)
    love.graphics.circle("fill", self.x, self.y, self.radius)
    love.graphics.setColor(r, g, b, a)
end

function Ball:start(speed, angle)
    self.speed = speed
    self.angle = angle -- radians 0 is at 90 degrees
    self.started = true
end