local GameRules = require "game.GameRules"
local GameObjectCollection = require "engine.GameObjectCollection"

--- Manages main game engine loop (start, update, stop).
---@class Loop
---@field private _gameWorld GameObjectCollection All objects of the game universe.
---@field private _gameObjectsChanged function? Callback to react on changes.
local Loop = {}

---@return Loop
function Loop:new()
    -- Lua code to find object & inherited methods (tinyurl.com/oop-lua)
    local newObject = setmetatable({}, self); self.__index = self

    newObject._gameWorld = GameObjectCollection:new()
    newObject._gameObjectsChanged = nil

    return newObject
end

--- Starts a game engine and assigns callback to be called when objects change.
---@param listener function Callback function to be called when relayout is required
function Loop:startWithObjectListener(listener)
    self._gameWorld = GameRules:createWorld()
    self._gameObjectsChanged = listener
end

function Loop:stop()
    self._gameObjectsChanged = nil
end

--- Triggers game engine time shift.
---@param dt number Time difference from previous similar event in game time
function Loop:timePassed(dt)
    -- default scenario: platform time = game time
    GameRules:updateWorld(self._gameWorld, dt)

    -- run callback to coordinator with each time increment
    if self._gameObjectsChanged ~= nil then
        self:_gameObjectsChanged()
    end
end

--- Returns viewable game objects grouped by type for easier parsing.
---@return GameObjectCollection
function Loop:getViewableObjects()
    -- default scenario: returns all objects of the universe
    return self._gameWorld
end

--- Returns game state objects grouped by type.
---@return GameObjectCollection
function Loop:getStateObjects()
    -- default scenario: returns all objects of the universe
    return self._gameWorld
end

return Loop