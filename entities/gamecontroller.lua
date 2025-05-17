GameController = Object:extend()

function GameController:new()
    self.screenWidth, self.screenHeight = love.graphics.getDimensions()

    self.playerPaddle = PlayerPaddle(50, self.screenHeight / 2, Vector4(1, 0, 0, 1))
    self.aiPaddle = AIPaddle(self.screenWidth - 50, self.screenHeight / 2, Vector4(0, 1, 0, 1))
    self.ball = Ball(self.screenWidth / 2, self.screenHeight / 2, Vector4(1, 1, 1, 1))
    self.playerScore = Score(self.screenWidth / 4, 10, 30, 50, 5)
    self.aiScore = Score(self.screenWidth - (self.screenWidth / 4), 10, 30, 50, 5)

    math.randomseed(os.time())
    local bx = math.random(45, 135)
    local dir = math.random(1, 2)
    if dir == 1 then
        bx = -bx
    end

    self.ball:start(500, bx)
    self.playerScore:setScore(0)
    self.aiScore:setScore(0)
    self.lastScoreUpdate = 0
end

function GameController:update(dt)
    self.lastScoreUpdate = self.lastScoreUpdate + dt
    if self.lastScoreUpdate > 0.5 then
        self.playerScore:increment()
        self.aiScore:increment()
        self.lastScoreUpdate = 0
    end

    self.playerPaddle:update(dt)
    self.aiPaddle:update(dt)
    self.ball:update(dt)
    self.playerScore:update(dt)
    self.aiScore:update(dt)
end

function GameController:draw()
    self.playerPaddle:draw()
    self.aiPaddle:draw()
    self.ball:draw()
    self.playerScore:draw()
    self.aiScore:draw()
end

return GameController()