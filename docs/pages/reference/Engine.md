---
layout: default
title: Engine Class
permalink: /reference/engine
parent: Reference
nav_order: 1
---
# Engine Class

Coordinates game objects' run loop, visual properties, and interaction.

## Private Properties

- **_isRunning** `boolean`: Indicates if the engine is running.
- **_rules** `GameRules`: Game rules for game objects.
- **_layout** `GameLayout`: Game view coordinator.
- **_controller** `GameController`: Game (touch) interaction.
- **_viewHierarchy** `ViewPair[]`: A z-indexed array of views.

## Public Methods

### new()

Creates a new instance of the Engine class.

**Returns:**
- `Engine`

### startEngine()

Starts the game engine.

### stopEngine()

Stops the game engine.

### drawViewHierarchy()

Renders previously layouted views in UI based on their z-index.

### timeEvent(dt)

Handles time events from the UI framework.

**Parameters:**
- `dt` `number`: Interval after the previous event in milliseconds.

### attributeTouch(x, y)

Checks touch attribution with a z-indexed hierarchy responder chain.

**Parameters:**
- `x` `number`: Mouse click or touch x-coordinate.
- `y` `number`: Mouse click or touch y-coordinate.
