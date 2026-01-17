require "app.compose"

-- returning layout is app-specific, and can be used for viewport configuration
local engine, layout = ComposeApp()

function love.load()
    engine:startEngine()
end

function love.update(dt)
    engine:timeEvent(dt)
end

function love.draw()
    engine:drawViewHierarchy()
end

-- `mousepressed` works both for macOS and iOS
function love.mousepressed(x, y, button, istouch, presses)
    engine:attributeTouch(x, y)
end

function love.quit()
    engine:stopEngine()
end