Score = Object:extend()

function Score:new(x, y, digitWidth, digitHeight, digitThickness)
    self.x = x
    self.y = y
    self.score = 0
    local scoreWidth = (digitWidth  * 3) + (digitThickness * 2)
    self.digitPositions = {
        self.x - (scoreWidth / 2),
        self.x - (digitWidth / 2),
        self.x + ((scoreWidth / 2) - digitWidth)
    }

    self.hundreds = Digit(self.digitPositions[1], 10, digitWidth, digitHeight, digitThickness)
    self.tens = Digit(self.digitPositions[2], 10, digitWidth, digitHeight, digitThickness)
    self.units = Digit(self.digitPositions[3], 10, digitWidth, digitHeight, digitThickness)
end

function Score:update(dt)
    self.hundreds:update(dt)
    self.tens:update(dt)
    self.units:update(dt)
end

function Score:draw()
    self.hundreds:draw()
    self.tens:draw()
    self.units:draw()
end

function Score:setScore(score)
    self.score = score
end

function Score:increment()
    self.score = self.score + 1
    local tempHundreds = math.floor(self.score / 100)
    local tempTens = math.floor((self.score - (tempHundreds * 100)) / 10)
    local tempUnits = math.floor(self.score - ((tempHundreds * 100) + (tempTens * 10)))
    print(self.score, tempHundreds, tempTens, tempUnits)
    self.hundreds:setValue(tempHundreds)
    self.tens:setValue(tempTens)
    self.units:setValue(tempUnits)
end

function Score:reset()
    self.score = 0
end