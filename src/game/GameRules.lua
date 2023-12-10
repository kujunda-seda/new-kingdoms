local GameObjectCollection = require "types.GameObjectCollection"
-- [Require all game objects for game world]
local PlaceholderObject = require "objects.PlaceholderObject"

--- Creates and updates game objects according to game rules.
---@class GameRules
local GameRules = {}

-- Only class methods are used, therefore no constructor for instances exists.

---@return GameObjectCollection
function GameRules:createWorld()

    local gameWorld = GameObjectCollection:new()

    -- [Create, configure game objects and add them to gameWorld]

    local aPlaceholderObject = PlaceholderObject:new()

    -- [Configure game object]

    gameWorld:insertObject(aPlaceholderObject)

    return gameWorld
end

---@param gameWorld GameObjectCollection All objects of the game universe
---@param timediff number Game world time difference from previous call
function GameRules:updateWorld(gameWorld, timediff)

    -- [Update all object types of gameWorld]
    for _, placeholderObject in ipairs(gameWorld:gameObjectArray(PlaceholderObject)) do
        placeholderObject:updateWith(timediff)
    end
end

return GameRules