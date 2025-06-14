require "types.View"
require "types.GameObject"

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

--- Cast view pair's types.
---@generic TV:View
---@generic TO:GameObject
---@param viewClass TV view type
---@param objectClass TO object type
---@return TV, TO
function ViewPair:cast(viewClass, objectClass)
    return self.view, self.object
end

return ViewPair