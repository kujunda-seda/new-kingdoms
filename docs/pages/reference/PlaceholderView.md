---
layout: default
title: PlaceholderView Class
permalink: /reference/placeholderview
parent: Reference
nav_order: 1
---
# PlaceholderView Class

## Public Properties

- **isDisabled** (`boolean`): Indicates if the view takes part in interaction.
- **x** (`number`): x-position on screen.
- **y** (`number`): y-position on screen.

## Public Methods

### new()

Creates a new instance of the PlaceholderView class.

**Returns:**
- `PlaceholderView`

### draw()

Uses UI framework functionality to draw the view.

### touchInside(x, y)

Checks if touch was made within view boundaries.

**Parameters:**
- `x` (`number`): Touch x-coordinate.
- `y` (`number`): Touch y-coordinate.

**Returns:**
- `boolean`: `true` if the object was interacted with.