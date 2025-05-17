Digit = Object:extend()

function Digit:new(x, y, digitWidth, digitHeight, digitThickness)
    self.x = x
    self.y = y
    self.value = 0
    self.digitWidth = digitWidth
    self.digitHeight = digitHeight
    self.digitThickness = digitThickness
end

function Digit:update(dt)

end

function Digit:draw()
    local r, g, b, a = love.graphics.getColor()
    love.graphics.setColor(1, 1, 1, 1)
    self:drawNumber(self.value)
    love.graphics.setColor(r, g, b, a)
end

function Digit:drawNumber(digit)
    local digits = {
        1 + 2 + 4 + 16 + 32 + 64,       -- 0
        4 + 32 ,                        -- 1
        1 + 4 + 8 + 16 + 64,            -- 2
        1 + 4 + 8 + 32 + 64,            -- 3
        2 + 4 + 8 + 32,                 -- 4
        1 + 2 + 8 + 32 + 64,            -- 5
        1 + 2 + 8 + 16 + 32 + 64,       -- 6
        1 + 4 + 32,                     -- 7
        1 + 2 + 4 + 8 + 16 + 32 + 64,   -- 8
        1 + 2 + 4 + 8 + 32              -- 9
    }

    -- add 1 to the digit as lua arrays start at 1 not 0
    local segmentValue = digits[digit + 1]
    --print(digit, segmentValue)

    for segment = 6, 0, -1 do
        --print(digit, segment, segmentValue, 2^segment)
        if segmentValue >= 2 ^ segment then
            if segment == 0 then
                -- 1 (top bar)
                love.graphics.rectangle("fill", self.x, self.y, self.digitWidth, self.digitThickness)
            elseif segment == 1 then
                -- 2 (left-top bar)
                love.graphics.rectangle("fill", self.x, self.y, self.digitThickness, self.digitHeight / 2)
            elseif segment == 2 then
                -- 4 (right-top bar)
                love.graphics.rectangle("fill", self.x + (self.digitWidth - self.digitThickness), self.y, self.digitThickness, self.digitHeight / 2)
            elseif segment == 3 then
                -- 8 (middle bar)
                love.graphics.rectangle("fill", self.x, self.y + (self.digitHeight / 2) - (self.digitThickness / 2), self.digitWidth, self.digitThickness)
            elseif segment == 4 then
                -- 16 (left-bottom bar)
                love.graphics.rectangle("fill", self.x, self.y + self.digitHeight / 2, self.digitThickness, self.digitHeight / 2)
            elseif segment == 5 then
                -- 32 (right-bottom bar)
                love.graphics.rectangle("fill", self.x + (self.digitWidth - self.digitThickness), self.y + self.digitHeight / 2, self.digitThickness, self.digitHeight / 2)
            elseif segment == 6 then
                -- 64 (bottom bar)
                love.graphics.rectangle("fill", self.x, self.y + self.digitHeight - self.digitThickness, self.digitWidth, self.digitThickness)
            end

            segmentValue = segmentValue - (2 ^ segment)
        end
    end
end

function Digit:setValue(value)
    self.value = value
end