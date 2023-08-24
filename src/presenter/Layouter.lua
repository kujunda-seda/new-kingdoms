local ViewPair = require "presenter.ViewPair"
-- [Require all added views for layouting]
local PlaceholderView = require "views.PlaceholderView"

--- Visually maps supplied game objects into views.
---@class Layouter
local Layouter = {}

-- Constants
-- [Provide constants for layouting]

--- Creates view hierarchy with configured views and links them to corresponding objects.
---@param objects GameObjectCollection Type-associative table of indexed game objects, e.g. {objectType1 = {object1, object2}, ...}
---@return ViewPair[] viewHierarchy A z-indexed table of view:object pairs, e.g. [0]{view = view1,object = gameObject1}
function Layouter.layoutObjectsIntoViewHierarchy(objects)
    ---@type ViewPair[] A z-indexed table of view:object pairs, e.g. [0]{view = view1,object = gameObject1}
    local viewHierarchy = {}

    -- [Configure all parameters for views later used for drawing by type]
    local placeholders = objects.Placeholder
    if placeholders ~= nil then
        for _, placeholder in ipairs(placeholders) do
            ---@cast placeholder Placeholder
            local placeholderView = PlaceholderView:new()

            -- [Configure view]

            table.insert(viewHierarchy, ViewPair:new(placeholderView, placeholder))
        end
    end

    return viewHierarchy
end

return Layouter