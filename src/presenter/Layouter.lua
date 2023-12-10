require "types.GameObjectCollection"
local ViewPair = require "types.ViewPair"
-- all views for layouting
local PlaceholderView = require "views.PlaceholderView"
-- all referenced objects
local PlaceholderObject = require "objects.PlaceholderObject"

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

    local placeholderObjects = objects:gameObjectArray(PlaceholderObject)
    if placeholderObjects then
        for _, placeholderObject in ipairs(placeholderObjects) do
            local placeholderView = PlaceholderView:new()

            -- [Configure view]

            table.insert(viewHierarchy, ViewPair:new(placeholderView, placeholderObject))
        end
    end

    return viewHierarchy
end

return Layouter