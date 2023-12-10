local Presenter = require "presenter.Presenter"

local presenter = Presenter:new()

function love.load()
    presenter:startGameEngine()
end

function love.update(dt)
    presenter:timeEvent(dt)
end

function love.draw()
    presenter:drawViewHierarchy()
end

-- `mousepressed` works both for macOS and iOS
function love.mousepressed(x, y, button, istouch, presses)
    presenter:attributeTouchToObject(x, y)
end

function love.quit()
    presenter:stopGameEngine()
end