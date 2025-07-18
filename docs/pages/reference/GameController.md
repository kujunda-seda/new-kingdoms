---
layout: default
title: GameController Class
permalink: /reference/gamecontroller
parent: Reference
nav_order: 1
---
# GameController Class

Converts interaction events into meaningful object actions.

## Public Methods

### new()

Creates a new instance of the GameController class.

**Returns:**
- `GameController`

### processTouchFor(viewPair, x, y, state)

Processes the touch by invoking an object action.

**Parameters:**
- `viewPair` `ViewPair`: Intersected view-object pair.
- `x` `number`: Global x-coordinate.
- `y` `number`: Global y-coordinate.
- `state` `GameObjectCollection`: Type-associative table of indexed game objects.

**Returns:**
- `boolean`: Returns `true` if the event was processed and shouldn't be forwarded.
