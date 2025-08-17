---
layout: default
title: GameRules Class
permalink: /reference/gamerules
parent: Reference
nav_order: 2
---
# GameRules Class

Creates and updates game objects according to game rules (not keeping the state).

## Private Properties

- **_gameWorld** `GameObjectCollection`: All objects of the game universe.

## Public Methods

### new()

Creates a new instance of the GameRules class.

**Returns:**
- `GameRules`

### getViewableObjects()

Returns viewable game objects grouped by type for easier parsing.

**Returns:**
- `GameObjectCollection`

### getStateObjects()

Returns game state objects grouped by type.

**Returns:**
- `GameObjectCollection`

### createWorld()

Creates and returns configured game objects (game world).

**Returns:**
- `GameObjectCollection`

### updateWorld(timediff)

Updates the game world based on the time difference from the previous call.

**Parameters:**
- `timediff` `number`: Game world time difference from the previous call.
