local GameObject = require "objects.GameObject"

--- `Placeholder` game object is used to show an example game object only. Can be removed
---@class Placeholder:GameObject
local Placeholder = GameObject:new {}

--- Constants

---@return Placeholder
function Placeholder:new()
    -- Required code for instances to find defined methods and inheritance
    local newObject = setmetatable({}, self)
    self.__index = self

    -- [Configure new object]

    return newObject
end

--- Updates an example object
---@param time number Game timing difference from previous update
function Placeholder:updateWith(time)

    -- [Update logic]

end

--- Notifies object of interaction.
function Placeholder:objectInteracted()

    -- [Interaction logic]

end

return Placeholder