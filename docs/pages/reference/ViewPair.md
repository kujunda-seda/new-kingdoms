---
layout: default
title: ViewPair Class
permalink: /reference/viewpair
parent: Reference
nav_order: 1
---
# ViewPair Class

Structure linking `View` and a `GameObject`.

## Public Properties

- **view** `View`: The view component.
- **object** `GameObject`: The game object component.

## Public Methods

### new(view, object)

Creates a new instance of the ViewPair class.

**Parameters:**
- `view` `View`: The view component.
- `object` `GameObject`: The game object component.

**Returns:**
- `ViewPair`

### cast(viewClass, objectClass)

Casts the view pair's types.

**Parameters:**
- `viewClass` `TV:View`: The view type.
- `objectClass` `TO:GameObject`: The object type.

**Returns:**
- `TV, TO`: The casted view and object.
