function love.load()
    print("\n")

    Object = require "libraries/classic"
    require "libraries/vector2"
    require "libraries/vector3"
    require "libraries/vector4"
    require "libraries/array_extensions"
    require "libraries/math_extensions"
    require "libraries/table_extensions"
    require "libraries/eventhandler"

    require "entities/paddle"
    require "entities/playerpaddle"
    require "entities/aipaddle"
    require "entities/ball"
    require "entities/digit"
    require "entities/score"

    gameController = require "entities/gamecontroller"

end

function love.update(dt)
    gameController:update(dt)
end

function love.draw()
    gameController:draw()
end