local Engine = require "engine.Engine"
local GameRules = require "app.GameRules"
local GameLayout = require "app.GameLayout"
local GameController = require "app.GameController"

--- Root app composition.
---@return Engine engine configured engine
---@return GameLayout layout (app-specific return) layout for future configuration (e.g. viewport)
function ComposeApp()
    local rules = GameRules:new()
    local layout = GameLayout:new()
    local controller = GameController:new()

    local engine = Engine:new(rules, layout, controller)
    return engine, layout
end

return ComposeApp