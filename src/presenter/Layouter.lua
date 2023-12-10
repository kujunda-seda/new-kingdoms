require "types.GameObjectCollection"
local ViewPair = require "types.ViewPair"
-- all views for layouting
local CarView = require "views.CarView"
-- all referenced objects
local Car = require "objects.Car"

--- Visually maps supplied game objects into views.
---@class Layouter
local Layouter = {}

-- Only class methods are used, therefore no constructor for instances exists.

-- Constants
-- [Provide constants for layouting]

--- Creates view hierarchy with configured views and links them to corresponding objects.
---@param objects GameObjectCollection Type-associative table of indexed game objects
---@return ViewPair[] viewHierarchy A z-indexed table of view:object pairs
function Layouter.layoutObjectsIntoViewHierarchy(objects)

    ---@type ViewPair[]
    local viewHierarchy = {}

    -- configure parameters for all view types used for drawing

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