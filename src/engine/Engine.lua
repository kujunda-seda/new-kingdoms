local GameRules = require "app.GameRules"
local GameLayout = require "app.GameLayout"
local GameController = require "app.GameController"

--- Coordinates game objects' run loop, visual properties, and interaction.
---@class Engine
---@field private _isRunning boolean
---@field private _rules Ruleset Game rules for game objects
---@field private _layout Layout Game view coordinator
---@field private _controller Controller Game (touch) interaction
---@field private _viewHierarchy ViewPair[] A z-indexed array of views
local Engine = {}

---@param rules Ruleset
---@param layout Layout
---@param controller Controller
---@return Engine
function Engine:new(rules, layout, controller)
    -- Lua code to find object & inherited methods (tinyurl.com/oop-lua)
    local newObject = setmetatable({}, self); self.__index = self

    newObject._rules = rules
    newObject._layout = layout
    newObject._controller = controller
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