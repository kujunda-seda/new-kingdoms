local Layouter = require "presenter.Layouter"
local GameEngine = require "game.GameEngine"

--- `Presenter` is responsible for rendering game objects' visual properties.
---@class Presenter
---@field private viewHierarchy ViewPair[] A z-indexed array of views.
---@field private gameEngine GameEngine
local Presenter = {
    viewHierarchy = {}
}

---@return Presenter
function Presenter:new()
    -- Required code for instances to find defined methods and inheritance
    local newObject = setmetatable({}, self)
    self.__index = self

    newObject.viewHierarchy = {}
    newObject.gameEngine = GameEngine:new()

    return newObject
end

function Presenter:startGameEngine()
    local layoutViews = function()
        local objects = self.gameEngine:getViewableObjects()
        self.viewHierarchy = Layouter.layoutObjectsIntoViewHierarchy(objects)
    end
    self.gameEngine:startWithObjectListener(layoutViews)
end

function Presenter:stopGameEngine()
    self.gameEngine:stop()
end

--- Renders previously layouted views in UI based on their z-index.
function Presenter:drawViewHierarchy()
    for _, viewPair in ipairs(self.viewHierarchy) do  -- cycle through view hierarchy
        viewPair.view:draw()
    end
end

--- Time event from UI framework
---@param dt number Interval after previous event in milliseconds
function Presenter:timeEvent(dt)
    self.gameEngine:timePassed(dt)  -- use game time scale
end

--- Check touch attribution to a rendered object and pass it to the game.
---@param x number mouse click or touch x-coordinate
---@param y number mouse click or touch y-coordinate
function Presenter:attributeTouchToObject(x, y)
    for _, viewPair in ipairs(self.viewHierarchy) do  -- cycle through view hierarchy
        if viewPair.view:touchInside(x, y) then
            self.gameEngine:objectInteracted(viewPair.object)
            return  -- handle single first touch only
        end
    end
end

return Presenter