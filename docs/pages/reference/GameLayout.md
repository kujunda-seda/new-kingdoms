---
layout: default
title: GameLayout Class
permalink: /reference/gamelayout
parent: Reference
nav_order: 1
---
# GameLayout Class

Visually maps supplied game objects into views.

## Private Properties

- **_viewCache** `table`: Cache for view objects, indexed by game object.

## Public Methods

### new()

Creates a new instance of the GameLayout class.

**Returns:**
- `GameLayout`

### layoutObjectsIntoViewHierarchy(objects)

Creates view hierarchy with configured views and links them to corresponding objects.

**Parameters:**
- `objects` `GameObjectCollection`: Type-associative table of indexed game objects.

**Returns:**
- `ViewPair[]`: A z-indexed table of view:object pairs.

## Private Methods

### _updateCachedView(object, createViewFunction)

Checks if a view exists and is up-to-date for the given game object.

**Parameters:**
- `object` `GameObject`: The game object to check.
- `createViewFunction` `function`: Function to create a view.

**Returns:**
- `View`: New or existing view object.
