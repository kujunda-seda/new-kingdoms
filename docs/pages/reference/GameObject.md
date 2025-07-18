---
layout: default
title: GameObject Class
permalink: /reference/gameobject
parent: Reference
nav_order: 1
---
# GameObject Class

Game object interface (prototype).

## Public Properties

- **isDirty** `boolean`: Indicates if the object is dirty (needs update).

## Public Methods

### new(object)

Constructor for use in subclass declaration.

**Parameters:**
- `object` `table (optional)`: Required for subclassing `GameObject`.

**Returns:**
- `GameObject`: New `GameObject` object.

### class()

Returns the specific class of the object.

**Returns:**
- `GameObject`: Class object.

### objectInteracted()

Notifies the object of interaction.
