require "core.GameObjectCollection"
local ViewPair = require "core.ViewPair"
-- all views for layouting
local PlaceholderView = require "ui.PlaceholderView"
-- all referenced objects
local PlaceholderObject = require "entities.PlaceholderObject"

--- Visually maps supplied game objects into views.
---@class GameLayout:Layout
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

--- Signature of a function that creates view for game object
---@alias ViewFactory fun(self: GameLayout, object: GameObject): View

--- Creates a view:object pair in the view hierarchy if the object is present.
---@param objectCollection GameObjectCollection Type-associative table of indexed game objects
---@param classType table Object class type to search for in the collection of objects
---@param createViewFunction ViewFactory Factory function to create a view for the object
---@param viewHierarchy ViewPair[] View hierarchy that receives the view pair
---@private
function GameLayout:_addViewPair(objectCollection, classType, createViewFunction, viewHierarchy)
    local objects = objectCollection:gameObjectArray(classType)
    if not objects then return end
    for _, object in ipairs(objects) do
        local view = self:_updateCachedView(object, function()
            return createViewFunction(self, object)
        end)
        table.insert(viewHierarchy, ViewPair:new(view, object))
    end
end

--- Creates view hierarchy with configured views and links them to corresponding objects.
---@param objects GameObjectCollection Type-associative table of indexed game objects
---@return ViewPair[] viewHierarchy A z-indexed table of view:object pairs
function GameLayout:layoutObjectsIntoViewHierarchy(objects)
    ---@type ViewPair[]
    local viewHierarchy = {}

    -- [Configure parameters for all view types used for drawing]
    self:_addViewPair(objects, PlaceholderObject, self._createPlaceholderView, viewHierarchy)

    return viewHierarchy
end

-- Object specific view creation (ViewFactories)

---@param object PlaceholderObject Source game object
---@return PlaceholderView view Created view
---@private
function GameLayout:_createPlaceholderView(object)
    local view = PlaceholderView:new()

    -- [Logic and configuration for PlaceholderView] 

    return view
end

return GameLayout