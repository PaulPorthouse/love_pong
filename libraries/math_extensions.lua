
-- clamps the value to the range min -> mpoint1.x
function math.clamp(value, min, max)
    return math.min(math.max(value, min), max)
end

-- returns the angle between two points in radians (thanks, Copilot)
function math.angle(point1, point2)
    local deltaX = point2.x - point1.x
    local deltaY = point2.y - point1.y

    -- Use math.atan and handle the quadrants manually
    local angle
    if deltaX > 0 then
        angle = math.atan(deltaY / deltaX)
    elseif deltaX < 0 then
        angle = math.atan(deltaY / deltaX) + math.pi
    else -- deltaX == 0
        if deltaY > 0 then
            angle = math.pi / 2
        elseif deltaY < 0 then
            angle = -math.pi / 2
        else
            angle = 0 -- Points are the same
        end
    end

    return angle -- Convert to degrees if needed
end

function math.generatePointOnCircle(position, radius, numberOfPoints)
    local x, y
    local a = 0.0
    local da = 2.0 * math.pi / numberOfPoints

    local points = {}

    for i = 0, numberOfPoints - 1 do
        x = position.x + radius * math.cos(a)
        y = position.y + radius * math.sin(a)
        points[#points + 1] = Vector2(x, y)

        a= a + da
    end

    return points
end