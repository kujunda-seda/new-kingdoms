local GameObjectCollection = require "engine.GameObjectCollection"
-- [Require all game objects for game world]
local PlaceholderObject = require "objects.PlaceholderObject"

--- Creates and updates game objects according to game rules (not keeping the state).
---@class GameRules:Ruleset
---@field private _gameWorld GameObjectCollection  All objects of the game universe.
local GameRules = {}

--@return GameRules
function GameRules:new()
    -- Lua code to find object & inherited methods (tinyurl.com/oop-lua)
    local newObject = setmetatable({}, self); self.__index = self

    self._gameWorld = GameObjectCollection:new()
    return newObject
end

--- Returns viewable game objects grouped by type for easier parsing.
---@return GameObjectCollection
function GameRules:getViewableObjects()
    -- default scenario: returns all objects of the universe
    return self._gameWorld
end

--- Returns game state objects grouped by type.
---@return GameObjectCollection
function GameRules:getStateObjects()
    -- default scenario: returns all objects of the universe
    return self._gameWorld
end

-- Creates and returns configured game objects (game world)
---@return GameObjectCollection
function GameRules:createWorld()
    -- [Create, configure game objects and add them to gameWorld]
    local aPlaceholderObject = PlaceholderObject:new()
    self._gameWorld:insertObject(aPlaceholderObject)
    return self._gameWorld
end

---@param timediff number Game world time difference from previous call
function GameRules:updateWorld(timediff)
    -- [Update all object types of gameWorld]
    local placeholderObjects = self._gameWorld:gameObjectArray(PlaceholderObject)
    if placeholderObjects then
        for _, placeholderObject in ipairs(placeholderObjects) do
            placeholderObject:updateWith(timediff)
        end
    end
end

return GameRules