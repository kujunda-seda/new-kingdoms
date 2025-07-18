--- Game object interface (prototype)
---@class GameObject
---@field isDirty boolean Indicates if the object is dirty (needs update)
local GameObject = {}

--- Constructor for use in subclass declaration
---@param object table? Required for subclassing `GameObject`
---@return GameObject # New `GameObject` object  
function GameObject:new(object)
    -- Lua code to find object & inherited methods (tinyurl.com/oop-lua)
    local newObject = setmetatable(object or {}, self); self.__index = self

    newObject.isDirty = false
    return newObject
end

--- Returns specific class of object.
---@return GameObject class class object
function GameObject:class()
    return getmetatable(self)
end

--- Notifies object of interaction.
function GameObject:objectInteracted() end

return GameObject