local PlaceholderObject = require "src.objects.PlaceholderObject"
-- [Require all added game objects for game world]

--- All available game object types for easier by-type iteration during updates
---@alias GameObjectType
---| 'PlaceholderObject' # a placeholder set
-- [Define all game object types as an enumeration]

--- Type-associative table of indexed game objects, e.g. {objectType1 = {object1, object2}, ...}.<br> For autocompletion to work properly when specific objects are fetched, requires casting to a type `---@cast object1 GameObjectType`.
---@alias GameObjectCollection { [GameObjectType]: GameObject[] } 

--- Creates and updates game objects according to game rules.
---@class GameRules
local GameRules = {}

---@return GameObjectCollection
function GameRules:createWorld()

    ---@type GameObjectCollection
    local gameWorld = {}

    -- [Create, configure game objects and add them to gameWorld]
    gameWorld.PlaceholderObject = {}
    local aPlaceholderObject = PlaceholderObject:new()
    -- [Configure game object]
    table.insert(gameWorld.PlaceholderObject, aPlaceholderObject)

    return gameWorld
end

---@param gameWorld GameObjectCollection All objects of the game universe.
---@param timediff number Game world time difference from previous call
function GameRules:updateWorld(gameWorld, timediff)

    -- [Update all object types of gameWorld]
    for _, placeholderObject in ipairs(gameWorld.PlaceholderObject) do
        ---@cast placeholderObject PlaceholderObject
        placeholderObject:updateWith(timediff)
    end

end

return GameRules