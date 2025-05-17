AIPaddle = Paddle:extend()

function AIPaddle:new(x, y, color)
    AIPaddle.super.new(self, x, y, color)
end

function AIPaddle:update(dt)
    AIPaddle.super.update(self, dt)
end

function AIPaddle:draw()
    AIPaddle.super.draw(self)
end