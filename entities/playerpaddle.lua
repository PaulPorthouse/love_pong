PlayerPaddle = Paddle:extend()

function PlayerPaddle:new(x, y, color)
    PlayerPaddle.super.new(self, x, y, color)
end

function PlayerPaddle:update(dt)
    PlayerPaddle.super.update(self, dt)
end

function PlayerPaddle:draw()
    PlayerPaddle.super.draw(self)
end