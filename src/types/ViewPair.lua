--- Structure linking `View` and a `GameObject`
---@class ViewPair
---@field view View
---@field object GameObject
local ViewPair = {}

---@param view View
---@param object GameObject
---@return ViewPair
function ViewPair:new(view, object)
    local newObject = {view = view, object = object}

    -- Required code for instances to find defined methods and inheritance
    setmetatable(newObject, self)
    self.__index = self

    return newObject
end

return ViewPair