require "core.View"
require "core.GameObject"

--- Structure linking `View` and a `GameObject`
---@class ViewPair
---@field view View
---@field object GameObject
local ViewPair = {}

---@param view View
---@param object GameObject
---@return ViewPair
function ViewPair:new(view, object)
    -- Lua code to find object & inherited methods (tinyurl.com/oop-lua)
    local newObject = setmetatable({}, self); self.__index = self

    newObject.view = view
    newObject.object = object

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