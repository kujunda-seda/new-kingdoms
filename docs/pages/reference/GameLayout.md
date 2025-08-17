---
layout: default
title: GameLayout Class
permalink: /reference/gamelayout
parent: Reference
nav_order: 3
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

### _addViewPair(objectCollection, classType, createViewFunction, viewHierarchy)

Creates a view:object pair in the view hierarchy if the object is present.

**Parameters:**
- `objectCollection` `GameObjectCollection`: Type-associative table of indexed game objects.
- `classType` `table`: Object class type to search for in the collection of objects.
- `createViewFunction` `ViewFactory`: Factory function to create a view for the object.
- `viewHierarchy` `ViewPair[]`: View hierarchy that receives the view pair.

### _createPlaceholderView(object)

Creates a placeholder view for the given object.

**Parameters:**
- `object` `PlaceholderObject`: Source game object.

**Returns:**
- `PlaceholderView`: Created view.
