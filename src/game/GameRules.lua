-- [Require all added game objects for game world]

--- All available game object types for easier by-type iteration during updates
---@alias GameObjectType
---| 'Default' # a placeholder set
-- [Define all game object types]

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

    return gameWorld
end

---@param gameWorld GameObjectCollection All objects of the game universe.
---@param timediff number Game world time difference from previous call
function GameRules:updateWorld(gameWorld, timediff)

    -- [Update objects of gameWorld]

end

return GameRules