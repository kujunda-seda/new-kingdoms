local GameRules = require "game.GameRules"
local GameObjectCollection = require "types.GameObjectCollection"

--- Manages main game engine loop (start, update, stop).
---@class Loop
---@field private gameWorld GameObjectCollection All objects of the game universe.
---@field private gameObjectsChanged function? Callback to react on changes.
local Loop = {}

---@return Loop
function Loop:new()
    -- Lua code to find object & inherited methods (tinyurl.com/oop-lua)
    local newObject = setmetatable({}, self); self.__index = self

    newObject.gameWorld = GameObjectCollection:new()
    newObject.gameObjectsChanged = nil

    return newObject
end

--- Starts a game engine and assigns callback to be called when objects change.
---@param listener function Callback function to be called when relayout is required
function Loop:startWithObjectListener(listener)
    self.gameWorld = GameRules:createWorld()
    self.gameObjectsChanged = listener
end

function Loop:stop()
    self.gameObjectsChanged = nil
end

--- Triggers game engine time shift.
---@param dt number Time difference from previous similar event in game time
function Loop:timePassed(dt)
    -- default scenario: platform time = game time
    GameRules:updateWorld(self.gameWorld, dt)

    -- run callback to coordinator with each time increment
    if self.gameObjectsChanged ~= nil then
        self:gameObjectsChanged()
    end
end

--- Returns viewable game objects grouped by type for easier parsing.
---@return GameObjectCollection
function Loop:getViewableObjects()
    -- default scenario: returns all objects of the universe
    return self.gameWorld
end

return Loop