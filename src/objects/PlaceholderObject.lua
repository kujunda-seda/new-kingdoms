local GameObject = require "types.GameObject"

--- `PlaceholderObject` game object is used to show an example game object only. Can be removed
---@class PlaceholderObject:GameObject
local PlaceholderObject = GameObject:new {}

--- Constants

---@return PlaceholderObject
function PlaceholderObject:new()
    -- Required code for instances to find defined methods and inheritance
    local newObject = setmetatable({}, self)
    self.__index = self

    -- [Configure new object]

    return newObject
end

--- Updates an example object
---@param time number Game timing difference from previous update
function PlaceholderObject:updateWith(time)

    -- [Update logic]

end

--- Notifies object of interaction
function PlaceholderObject:objectInteracted()

    -- [Interaction logic]

end

return PlaceholderObject