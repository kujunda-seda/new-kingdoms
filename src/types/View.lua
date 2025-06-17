--- View interface (prototype).
---@class View
local View = {}

--- Constructor for use in subclass declaration.
---@param object table? Required for subclassing `View`
---@return View # New `View` object  
function View:new(object)
    -- Required code for instances to find defined methods and inheritance
    local newObject = setmetatable(object or {}, self)
    self.__index = self

    return newObject
end

--- Uses UI framework functionality to draw the view.
function View:draw() end

--- Checks if touch was made within view boundaries.
---@param x number global x-coordinate
---@param y number global y-coordinate
---@return boolean
function View:touchInside(x, y) return false end

return View