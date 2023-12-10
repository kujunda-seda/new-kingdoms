local GameObject = require "types.GameObject"

--- `Stage` game object is responsible for the background stage (passive).
---@class Stage:GameObject
local Stage = GameObject:new {}

---@return Stage
function Stage:new()
    -- Required code for instances to find defined methods and inheritance
    local newObject = setmetatable({}, self)
    self.__index = self

    return newObject
end

return Stage