require "types.GameObjectCollection"
local ViewPair = require "types.ViewPair"
-- all views for layouting
local CarView = require "views.CarView"
local StageView = require "views.StageView"
-- all referenced objects
local Car = require "objects.Car"
local Stage = require "objects.Stage"

--- Visually maps supplied game objects into views.
---@class Layouter
local Layouter = {}

-- Only class methods are used, therefore no constructor for instances exists.

-- Constants

local ROAD_CONFIG = StageView.getConfiguration()
local ROAD_X = love.graphics.getWidth() * ROAD_CONFIG.ROAD_OFFSET  -- Road offset on screen
local CAR_X = ROAD_X + (ROAD_CONFIG.LANE_WIDTH - CarView.getConfiguration().WIDTH) / 2
local ROAD_LENGTH = love.graphics.getHeight()+10  -- Length of the road
local COLOR = {
    white = {1,1,1},
    red = {1,0.2,0.2}
}

--- Creates view hierarchy with configured views and links them to corresponding objects.
---@param objects GameObjectCollection Type-associative table of indexed game objects
---@return ViewPair[] viewHierarchy A z-indexed table of view:object pairs
function Layouter.layoutObjectsIntoViewHierarchy(objects)

    ---@type ViewPair[]
    local viewHierarchy = {}

    -- configure parameters for all view types used for drawing

    local stage = objects:firstOfType(Stage)
    if stage then
        local stageView = StageView:new(0, 0, love.graphics.getWidth(), love.graphics.getHeight())
        table.insert(viewHierarchy, ViewPair:new(stageView, stage))
    end

    local cars = objects:gameObjectArray(Car)
    if cars then
        for _, car in ipairs(cars) do
            local carView = CarView:new()
            carView.x = CAR_X
            carView.y = car.roadPosition * ROAD_LENGTH
            carView.color = (car.isActivated == true) and COLOR.red or COLOR.white
            table.insert(viewHierarchy, ViewPair:new(carView, car))
        end
    end

    return viewHierarchy
end

return Layouter