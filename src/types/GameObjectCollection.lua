require "types.GameObject"

--- Type-associated table of indexed game objects, e.g. {classA = {object1, object2}, ...}.
---@class GameObjectCollection
---@field private objects GameObjectCollectionType
local GameObjectCollection = {}

---@generic GOT:GameObject
---@alias GameObjectCollectionType { [GOT]: GOT[] }

---@return GameObjectCollection
function GameObjectCollection:new()
    -- Required code for instances to find defined methods and inheritance
    local newObject = setmetatable({}, self)
    self.__index = self

    newObject.objects = {}

    return newObject
end

--- Insert object of type
---@param object GameObject
function GameObjectCollection:insertObject(object)

    local type = object:class()
    local arrayOfObjects = self:gameObjectArray(type)
    if not arrayOfObjects then
        self.objects[type] = {}
        arrayOfObjects = self.objects[type]
    end
    table.insert(arrayOfObjects, object)
end

--- Get array of game objects by type.
---@generic T:GameObject
---@param type T
---@return T[]|nil
function GameObjectCollection:gameObjectArray(type)
    return self.objects[type]
end

--- Returns first element of type.
---@generic T:GameObject
---@param type T
---@return T|nil firstElement
function GameObjectCollection:firstOfType(type)
    local arrayOfObjects = self:gameObjectArray(type)
    if not arrayOfObjects then return nil end
    return arrayOfObjects[1]
end

return GameObjectCollection
