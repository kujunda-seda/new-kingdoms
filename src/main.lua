local Coordinator = require "engine.Coordinator"

local coordinator = Coordinator:new()

function love.load()
    coordinator:startEngine()
end

function love.update(dt)
    coordinator:timeEvent(dt)
end

function love.draw()
    coordinator:drawViewHierarchy()
end

-- `mousepressed` works both for macOS and iOS
function love.mousepressed(x, y, button, istouch, presses)
    coordinator:attributeTouch(x, y)
end

function love.quit()
    coordinator:stopEngine()
end