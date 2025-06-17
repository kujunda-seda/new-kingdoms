local Engine = require "game.Engine"
local GameLayout = require "presenter.GameLayout"
local GameController = require "game.GameController"

--- Coordinates game objects' run loop, visual properties, and interaction.
---@class Presenter
---@field private engine Engine Game loop coordinator
---@field private layout GameLayout Game view coordinator
---@field private controller GameController Game (touch) interaction
---@field private viewHierarchy ViewPair[] A z-indexed array of views
local Presenter = {}

---@return Presenter
function Presenter:new()
    -- Lua code to find object & inherited methods (tinyurl.com/oop-lua)
    local newObject = setmetatable({}, self); self.__index = self

    newObject.engine = Engine:new()
    newObject.layout = GameLayout:new()
    newObject.controller = GameController:new()
    newObject.viewHierarchy = {}

    return newObject
end

function Presenter:startEngine()
    local layoutViews = function()
        local objects = self.engine:getViewableObjects()
        self.viewHierarchy = self.layout:layoutObjectsIntoViewHierarchy(objects)
    end

    self.engine:startWithObjectListener(layoutViews)
end

function Presenter:stopEngine()
    self.engine:stop()
end

--- Renders previously layouted views in UI based on their z-index.
function Presenter:drawViewHierarchy()
    for _, viewPair in ipairs(self.viewHierarchy) do  -- cycle through view hierarchy
        viewPair.view:draw()
    end
end

--- Time event from UI framework.
---@param dt number Interval after previous event in milliseconds
function Presenter:timeEvent(dt)
    self.engine:timePassed(dt)  -- use game time scale
end

--- Check touch attribution with z-indexed hierarchy responder chain.
---@param x number mouse click or touch x-coordinate
---@param y number mouse click or touch y-coordinate
function Presenter:attributeTouch(x, y)
    for _, viewPair in ipairs(self.viewHierarchy) do  -- cycle through z-indexed view hierarchy
        if viewPair.view:touchInside(x, y) then
            if self.controller:processTouchFor(viewPair, x, y) then
                return -- stop responder chain after first successfully processed event
            end
        end
    end
end

return Presenter