local GameRules = require "game.GameRules"
local GameObjectCollection = require "types.GameObjectCollection"

--- Manages main game engine loop (start, update, stop).
---@class Engine
---@field private gameWorld GameObjectCollection All objects of the game universe.
---@field private gameObjectsChanged function? Callback to react on changes.
local Engine = {}

---@return Engine
function Engine:new()
    -- Required code for instances to find defined methods and inheritance
    local newObject = setmetatable({}, self)
    self.__index = self

    newObject.gameWorld = GameObjectCollection:new()
    newObject.gameObjectsChanged = nil

    return newObject
end

--- Starts a game engine and assigns callback to be called when objects change.
---@param listener function Callback function to be called when relayout is required
function Engine:startWithObjectListener(listener)
    self.gameWorld = GameRules:createWorld()
    self.gameObjectsChanged = listener
end

function Engine:stop()
    self.gameObjectsChanged = nil
end

--- Triggers game engine time shift.
---@param dt number Time difference from previous similar event in game time
function Engine:timePassed(dt)
    -- default scenario: platform time = game time
    GameRules:updateWorld(self.gameWorld, dt)

    -- run callback to presenter with each time increment
    if self.gameObjectsChanged ~= nil then
        self:gameObjectsChanged()
    end
end

--- Returns viewable game objects grouped by type for easier parsing.
---@return GameObjectCollection
function Engine:getViewableObjects()
    -- default scenario: returns all objects of the universe
    return self.gameWorld
end

return Engine