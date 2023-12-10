local View = require "types.View"

--- Stage view representing `Stage` game object in UI.
---@class StageView:View
---@field isDisabled boolean Indicates if the view takes part in interaction
---@field private x number
---@field private y number
---@field private width number
---@field private height number
local StageView = View:new {}

-- Class constants
local COLOR_WHITE = {1,1,1}
local LANE_WIDTH = 50
local ROAD_OFFSET = 0.5
function StageView.getConfiguration()
    return {
        LANE_WIDTH = LANE_WIDTH,
        ROAD_OFFSET = ROAD_OFFSET
    }
end

---@return StageView
function StageView:new(x,y, width, height)
    -- Required code for instances to find defined methods and inheritance
    local newObject = setmetatable({}, self)
    self.__index = self

    newObject.isDisabled = true
    newObject.x = x
    newObject.y = y
    newObject.width = width
    newObject.height = height

    return newObject
end

--- Uses UI framework functionality to draw the view.
function StageView:draw()
    -- add class/object constants
    -- move road constants out of layouter
    love.graphics.setColor(COLOR_WHITE)
    love.graphics.rectangle("line",
                            (self.width - self.x) * ROAD_OFFSET,
                            self.y,
                            LANE_WIDTH,
                            self.height - self.y + 1)
end

return StageView