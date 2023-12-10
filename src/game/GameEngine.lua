local GameRules = require "game.GameRules"
local GameObjectCollection = require "types.GameObjectCollection"

---Manages game objects and relationships between them, e.g. creating scenes.
---@class GameEngine
---@field private gameWorld GameObjectCollection All objects of the game universe.
---@field private gameObjectsChanged function? Callback to react on changes.
local GameEngine = {}

---@return GameEngine
function GameEngine:new()
    -- Required code for instances to find defined methods and inheritance
    local newObject = setmetatable({}, self)
    self.__index = self

    newObject.gameWorld = GameObjectCollection:new()
    newObject.gameObjectsChanged = nil

    return newObject
end

--- Starts a game engine and assigns callback to be called when objects change.
---@param listener function Callback function to be called when relayout is required
function GameEngine:startWithObjectListener(listener)
    self.gameWorld = GameRules:createWorld()
    self.gameObjectsChanged = listener
end

function GameEngine:stop()
    self.gameObjectsChanged = nil
end

--- Triggers game engine time shift.
---@param dt number Time difference from previous similar event in game time
function GameEngine:timePassed(dt)
    -- default scenario: platform time = game time
    GameRules:updateWorld(self.gameWorld, dt)

    -- run callback to presenter
    if self.gameObjectsChanged ~= nil then
        self:gameObjectsChanged()
    end
end

--- Returns viewable game objects grouped by type for easier parsing.
---@return GameObjectCollection
function GameEngine:getViewableObjects()
    -- default scenario: returns all objects of the universe
    return self.gameWorld
end

--- Propagates touch event to an engine so it can decide if it should be chained to an object or handled otherwise.
---@param object GameObject
function GameEngine:objectInteracted(object)
    -- default scenario: channel / responder-chain all events to objects
    object:objectInteracted()
end

return GameEngine