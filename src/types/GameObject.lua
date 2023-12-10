--- _Prototype_ GameObject interface.
---@class GameObject
local GameObject = {}

--- _Prototype_ GameObject constructor for use in subclass declaration.
---@param object table? Required when subclassing `GameObject` to add new properties
---@return GameObject # New `GameObject` object  
function GameObject:new(object)
    -- Required code for instances to find defined methods and inheritance
    local newObject = setmetatable(object or {}, self)
    self.__index = self

    return newObject
end

--- Notifies object of interaction.
function GameObject:objectInteracted() end

return GameObject