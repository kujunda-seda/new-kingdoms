local GameRules = require "game.GameRules"
local GameLayout = require "game.GameLayout"
local GameController = require "game.GameController"

--- Coordinates game objects' run loop, visual properties, and interaction.
---@class Engine
---@field private _isRunning boolean
---@field private _rules GameRules Game rules for game objects
---@field private _layout GameLayout Game view coordinator
---@field private _controller GameController Game (touch) interaction
---@field private _viewHierarchy ViewPair[] A z-indexed array of views
local Engine = {}

---@return Engine
function Engine:new()
    -- Lua code to find object & inherited methods (tinyurl.com/oop-lua)
    local newObject = setmetatable({}, self); self.__index = self

    newObject._rules = GameRules:new()
    newObject._layout = GameLayout:new()
    newObject._controller = GameController:new()
    newObject._viewHierarchy = {}

    return newObject
end

function Engine:_layoutViews()
    local objects = self._rules:getViewableObjects()
    self._viewHierarchy = self._layout:layoutObjectsIntoViewHierarchy(objects)
end

function Engine:startEngine()
    self._rules:createWorld()
    self._isRunning = true
end

function Engine:stopEngine()
    self._isRunning = false
end

--- Renders previously layouted views in UI based on their z-index.
function Engine:drawViewHierarchy()
    for _, viewPair in ipairs(self._viewHierarchy) do  -- cycle through view hierarchy
        viewPair.view:draw()
    end
end

--- Time event from UI framework.
---@param dt number Interval after previous event in milliseconds
function Engine:timeEvent(dt)
    if self._isRunning then
        -- default scenario: platform time = update time
        self._rules:updateWorld(dt)
        -- run callback to layout engine with each time increment
        self:_layoutViews()
    end
end

--- Check touch attribution with z-indexed hierarchy responder chain.
---@param x number mouse click or touch x-coordinate
---@param y number mouse click or touch y-coordinate
function Engine:attributeTouch(x, y)
    local state = self._rules:getStateObjects()
    for _, viewPair in ipairs(self._viewHierarchy) do  -- cycle through z-indexed view hierarchy
        if viewPair.view:touchInside(x, y) then
            if self._controller:processTouchFor(viewPair, x, y, state) then
                return -- stop responder chain after first successfully processed event
            end
        end
    end
end

return Engine