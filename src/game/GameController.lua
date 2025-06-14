local ViewPair = require "types.ViewPair"

--- Converts interaction events into meaningful object actions.
---@class GameController
local GameController = {}

---@return GameController
function GameController:new()
    -- Required code for instances to find defined methods and inheritance
    local newObject = setmetatable({}, self)
    self.__index = self

    return newObject
end

--- Processes the touch by invoking an object action.
---@param viewPair ViewPair intersected view-object pair
---@param x number global x-coordinate
---@param y number global y-coordinate
---@return boolean isProcessed returns true if the event was processed and shoudn't be forwarded.
function GameController:processTouchFor(viewPair, x, y)
    local type = viewPair.object:class()
    return true
end

return GameController