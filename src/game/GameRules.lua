local GameObjectCollection = require "types.GameObjectCollection"
-- [Require all game objects for game world]
local Car = require "objects.Car"

--- Creates and updates game objects according to game rules.
---@class GameRules
local GameRules = {}

-- Only class methods are used, therefore no constructor for instances exists.

---@return GameObjectCollection
function GameRules:createWorld()

    ---@type GameObjectCollection
    local gameWorld = GameObjectCollection:new()

    -- [Create, configure game objects and add them to gameWorld]

    local aCar = Car:new()
    aCar.speed = 30
    gameWorld:insertObject(aCar)

    return gameWorld
end

---@param gameWorld GameObjectCollection All objects of the game universe
---@param timediff number Game world time difference from previous call
function GameRules:updateWorld(gameWorld, timediff)

    -- [Update all object types of gameWorld]
    for _, car in ipairs(gameWorld:gameObjectArray(Car)) do
        car:moveWith(timediff)
    end
end

return GameRules