---
layout: default
title: Loop Class
permalink: /reference/loop
parent: Reference
nav_order: 1
---
# Loop Class

Manages main game engine loop (start, update, stop).

## Private Properties

- **_gameWorld** `GameObjectCollection`: All objects of the game universe.
- **_gameObjectsChanged** `function (optional)`: Callback to react on changes.

## Public Methods

### new()

Creates a new instance of the Loop class.

**Returns:**
- `Loop`

### startWithObjectListener(listener)

Starts a game engine and assigns a callback to be called when objects change.

**Parameters:**
- `listener` `function`: Callback function to be called when relayout is required.

### stop()

Stops the game engine.

### timePassed(dt)

Triggers game engine time shift.

**Parameters:**
- `dt` `number`: Time difference from the previous similar event in game time.

### getViewableObjects()

Returns viewable game objects grouped by type for easier parsing.

**Returns:**
- `GameObjectCollection`
