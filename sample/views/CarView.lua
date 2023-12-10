local View = require "types.View"

---Car view representing `Car` game object in UI.
---@class CarView:View
---@field isDisabled boolean Indicates if the view takes part in interaction.
---@field x number x-position on screen
---@field y number y-position on screen
---@field color number[] car color as rgb(a)
local CarView = View:new {}

-- Constants
local WIDTH = 30  -- Width of a car
local LENGTH = 70  -- Length of a car
function CarView.getConfiguration()
    return { WIDTH = WIDTH }
end

---@return CarView
function CarView:new()
    -- Required code for instances to find defined methods and inheritance
    local newObject = setmetatable({}, self)
    self.__index = self

    newObject.x = 0
    newObject.y = 0
    newObject.isDisabled = false
    newObject.color = {1,1,1}

    return newObject
end

--- Uses UI framework functionality to draw the view.
function CarView:draw()
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.x, self.y, WIDTH, LENGTH)
end

--- Checks if touch was made within view boundaries.
---@param x number touch x-coordinate
---@param y number touch y-coordinate
---@return boolean # `true` if object was interacted
function CarView:touchInside(x, y)
    return not self.isDisabled
        and (x >= self.x)
        and ((self.x + WIDTH) >= x)
        and (y >= self.y)
        and ((self.y + LENGTH) >= y)
end

return CarView