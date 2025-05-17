Paddle = Object:extend()

function Paddle:new(x, y, color)
    self.x = x
    self.y = y
    self.width = 10
    self.height = 50
    self.color = color
end

function Paddle:update(dt)

end

function Paddle:draw()
    local r, g, b, a = love.graphics.getColor()
    love.graphics.setColor(self.color.x, self.color.y, self.color.z, self.color.w)
    love.graphics.rectangle("fill", self.x - self.width / 2, self.y - self.height / 2, self.width, self.height)
    love.graphics.setColor(r, g, b, a)
end