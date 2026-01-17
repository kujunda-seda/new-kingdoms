local ViewPair = require "engine.ViewPair"

--- Converts interaction events into meaningful object actions.
---@class GameController:Controller
local GameController = {}

---@return GameController
function GameController:new()
    -- Lua code to find object & inherited methods (tinyurl.com/oop-lua)
    local newObject = setmetatable({}, self); self.__index = self

    return newObject
end

--- Processes the touch by invoking an object action.
---@param viewPair ViewPair intersected view-object pair
---@param x number global x-coordinate
---@param y number global y-coordinate
---@param state GameObjectCollection Type-associative table of indexed game objects
---@return boolean isProcessed returns true if the event was processed and shoudn't be forwarded.
function GameController:processTouchFor(viewPair, x, y, state)
    local type = viewPair.object:class()
    return true
end

return GameController