local Engine = require "engine.Engine"
local GameRules = require "app.GameRules"
local GameLayout = require "app.GameLayout"
local GameController = require "app.GameController"

--- Root app composition. Can be changed to have multiple returns for configuration.
---@return Engine engine configured engine
function ComposeApp()
    local rules = GameRules:new()
    local layout = GameLayout:new()
    local controller = GameController:new()

    local engine = Engine:new(rules, layout, controller)
    return engine
end

return ComposeApp