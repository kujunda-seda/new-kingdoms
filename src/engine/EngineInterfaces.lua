-- Engine interface declarations (Ruleset, Layout, Controller).
---@meta

--- Defines game simulation rules and game object lifecycle.
---@class Ruleset
local Ruleset = {}

--- Returns viewable game objects grouped by type for easier parsing.
---@return GameObjectCollection
function Ruleset:getViewableObjects() end

--- Returns game state objects grouped by type.
---@return GameObjectCollection
function Ruleset:getStateObjects() end

--- Creates and returns configured game objects (game world)
---@return GameObjectCollection
function Ruleset:createWorld() end

--- Updates game objects according to the ruleset.
---@param timediff number Game world time difference from previous call
function Ruleset:updateWorld(timediff) end

--- Defines view layout in a viewport.
---@class Layout
local Layout = {}

--- Creates view hierarchy with configured views, and links them to corresponding objects.
---@param objects GameObjectCollection Type-associative table of indexed game objects
---@return ViewPair[] viewHierarchy A z-indexed table of view:object pairs
function Layout:layoutObjectsIntoViewHierarchy(objects) end

--- Defines input interaction.
---@class Controller
local Controller = {}

--- Processes the touch by invoking an object action.
---@param viewPair ViewPair intersected view-object pair
---@param x number global x-coordinate
---@param y number global y-coordinate
---@param state GameObjectCollection Type-associative table of indexed game objects
---@return boolean isProcessed returns true if the event was processed and shoudn't be forwarded.
function Controller:processTouchFor(viewPair, x, y, state) end