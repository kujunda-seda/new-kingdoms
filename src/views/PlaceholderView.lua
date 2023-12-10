local View = require "types.View"

---Placeholder view representing example of `PlaceholderObject` game object in UI
---@class PlaceholderView:View
---@field isDisabled boolean Indicates if the view takes part in interaction.
---@field x number x-position on screen
---@field y number y-position on screen
local PlaceholderView = View:new {}

-- Constants
local WIDTH = 42  -- Width of a view
local HEIGHT = 42  -- Height of a view

---@return PlaceholderView
function PlaceholderView:new()
    -- Required code for instances to find defined methods and inheritance
    local newObject = setmetatable({}, self)
    self.__index = self

    newObject.x = 0
    newObject.y = 0
    newObject.isDisabled = false

    return newObject
end

--- Uses UI framework functionality to draw the view.
function PlaceholderView:draw()

    -- [LOVE framework drawing methods]

end

--- Checks if touch was made within view boundaries.
---@param x number touch x-coordinate
---@param y number touch y-coordinate
---@return boolean # `true` if object was interacted
function PlaceholderView:touchInside(x, y)
    return not self.isDisabled
        and (x >= self.x)
        and ((self.x + WIDTH) >= x)
        and (y >= self.y)
        and ((self.y + HEIGHT) >= y)
end

return PlaceholderView