---
layout: default
title: GameObjectCollection Class
permalink: /reference/gameobjectcollection
parent: Reference
nav_order: 1
---
# GameObjectCollection Class

Type-associated table of indexed game objects, e.g., `{classA = {object1, object2}, ...}`.

## Private Properties

- **_objects** `GameObjectCollectionType`: Internal storage for game objects.

## Public Methods

### new()

Creates a new instance of the GameObjectCollection class.

**Returns:**
- `GameObjectCollection`

### insertObject(object)

Inserts an object of a specific type.

**Parameters:**
- `object` `GameObject`: The game object to insert.

### gameObjectArray(type)

Gets an array of game objects by type.

**Parameters:**
- `type` `T:GameObject`: The type of game object.

**Returns:**
- `T[]?`: Array of game objects or `nil` if none exist.

### firstOfType(type)

Returns the first element of a specific type.

**Parameters:**
- `type` `T:GameObject`: The type of game object.

**Returns:**
- `T?`: The first element or `nil` if none exist.
