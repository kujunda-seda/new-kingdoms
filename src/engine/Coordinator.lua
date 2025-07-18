local Loop = require "engine.Loop"
local GameLayout = require "game.GameLayout"
local GameController = require "game.GameController"

--- Coordinates game objects' run loop, visual properties, and interaction.
---@class Coordinator
---@field private _loop Loop Main game loop
---@field private _layout GameLayout Game view coordinator
---@field private _controller GameController Game (touch) interaction
---@field private _viewHierarchy ViewPair[] A z-indexed array of views
local Coordinator = {}

---@return Coordinator
function Coordinator:new()
    -- Lua code to find object & inherited methods (tinyurl.com/oop-lua)
    local newObject = setmetatable({}, self); self.__index = self

    newObject._loop = Loop:new()
    newObject._layout = GameLayout:new()
    newObject._controller = GameController:new()
    newObject._viewHierarchy = {}

    return newObject
end

function Coordinator:startEngine()
    local layoutViews = function()
        local objects = self._loop:getViewableObjects()
        self._viewHierarchy = self._layout:layoutObjectsIntoViewHierarchy(objects)
    end

    self._loop:startWithObjectListener(layoutViews)
end

function Coordinator:stopEngine()
    self._loop:stop()
end

--- Renders previously layouted views in UI based on their z-index.
function Coordinator:drawViewHierarchy()
    for _, viewPair in ipairs(self._viewHierarchy) do  -- cycle through view hierarchy
        viewPair.view:draw()
    end
end

--- Time event from UI framework.
---@param dt number Interval after previous event in milliseconds
function Coordinator:timeEvent(dt)
    self._loop:timePassed(dt)  -- use game time scale
end

--- Check touch attribution with z-indexed hierarchy responder chain.
---@param x number mouse click or touch x-coordinate
---@param y number mouse click or touch y-coordinate
function Coordinator:attributeTouch(x, y)
    for _, viewPair in ipairs(self._viewHierarchy) do  -- cycle through z-indexed view hierarchy
        if viewPair.view:touchInside(x, y) then
            if self._controller:processTouchFor(viewPair, x, y) then
                return -- stop responder chain after first successfully processed event
            end
        end
    end
end

return Coordinator