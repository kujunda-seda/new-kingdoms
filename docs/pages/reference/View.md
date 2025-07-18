---
layout: default
title: View Class
permalink: /reference/view
parent: Reference
nav_order: 1
---
# View Class

View interface (prototype).

## Public Methods

### new(object)

Constructor for use in subclass declaration.

**Parameters:**
- `object` `table (optional)`: Required for subclassing `View`.

**Returns:**
- `View`: New `View` object.

### draw()

Uses UI framework functionality to draw the view.

### touchInside(x, y)

Checks if touch was made within view boundaries.

**Parameters:**
- `x` `number`: Global x-coordinate.
- `y` `number`: Global y-coordinate.

**Returns:**
- `boolean`
