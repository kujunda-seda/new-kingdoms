require "types.GameObjectCollection"
local ViewPair = require "types.ViewPair"
-- all views for layouting
local PlaceholderView = require "views.PlaceholderView"
-- all referenced objects
local PlaceholderObject = require "objects.PlaceholderObject"

--- Visually maps supplied game objects into views.
---@class GameLayout
---@field private _viewCache table Cache for view objects, indexed by game object
local GameLayout = {}

---@return GameLayout
function GameLayout:new()
    -- Lua code to find object & inherited methods (tinyurl.com/oop-lua)
    local newObject = setmetatable({}, self); self.__index = self

    newObject._viewCache = {}
    return newObject
end

-- Constants
-- [Provide constants for layouting]

--- Checks if a view exists and is up-to-date for the given game object.
---@generic T: View
---@param object GameObject The game object to check
---@param createViewFunction fun(): T Function to create a view
---@return T view new or existing view object
---@private
function GameLayout:_updateCachedView(object, createViewFunction)
    local view = self._viewCache[object]
    if not view or object.isDirty then
        view = createViewFunction()
        self._viewCache[object] = view
        object.isDirty = false
    end
    return view
end

--- Creates view hierarchy with configured views and links them to corresponding objects.
---@param objects GameObjectCollection Type-associative table of indexed game objects
---@return ViewPair[] viewHierarchy A z-indexed table of view:object pairs
function GameLayout:layoutObjectsIntoViewHierarchy(objects)

    ---@type ViewPair[]
    local viewHierarchy = {}

    -- configure parameters for all view types used for drawing

    local placeholderObjects = objects:gameObjectArray(PlaceholderObject)
    if placeholderObjects then
        for _, placeholderObject in ipairs(placeholderObjects) do

            local placeholderView = self:_updateCachedView(placeholderObject, function()
                return self:_createPlaceholderView(placeholderObject)
            end)
            table.insert(viewHierarchy, ViewPair:new(placeholderView, placeholderObject))
        end
    end

    return viewHierarchy
end

-- Object specific view creation

---@param object PlaceholderObject The object to create a view for
---@return PlaceholderView view The created view
---@private
function GameLayout:_createPlaceholderView(object)
    local view = PlaceholderView:new()

    -- [Logic and configuration for PlaceholderView] 

    return view
end

return GameLayout