---
layout: default
title: Samples
permalink: /samples/
nav_order: 3
---
# Samples
You can find a demo project in the [GitHub repository](https://github.com/kujunda-seda/new-kingdoms/tree/master/sample) and see all the required changes by comparing it with the engine (diff with the `src` folder).

The sample is based on version 0.1 and will be updated only at 1.0 release. It will work, but the engine code is not the latest.

The changes to engine are:
1. **PlaceholderObject** is modified to create `Car` and `Stage` objects.
2. **PlaceholderView** is modified to create respective `CarView` and `StageView` views.
3. **GameRules** are added to populate the `gameWorld` with the created objects.
4. **Layouter** code is added to layout the views in the `viewHierarchy` and link user interaction to `Car` objects.

## About the demo
It's a very simple simulation of a car driving down the road and changing its color upon interaction.

![video]({{ site.baseurl }}/assets/images/sample.gif)
