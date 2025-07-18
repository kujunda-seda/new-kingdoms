---
layout: default
title: How to use
permalink: /how-to-use/
nav_order: 1
---
# How to use
New Kingdoms helps rapidly iterate iOS games prototyping. It requires minimum effort to publish the game on an iOS device (together with [template-love-game](https://github.com/kujunda-seda/template-love-game) repository) and allows you to think of objects and their behaviours as in real life. You will need basic programming skills to code in Lua and advanced ability to analyze and model your objects and game rules. With all capabilities of the LÖVE engine you can easily create visual representation to see the objects' life unfold.

Most of the time, if you don't need to modify the engine itself (in the `/engine` folder), you'll operate in 5 areas:
- **Objects** - creating a class for each type of object in the simulation world.
- **GameRules** - to describe their interaction.
- **GameController** - to process input.
- **GameLayout** - for plotting the views on screen.
- **Views** - for visualisation of the specific objects.

You can skip visualisation and use CLI output if you want pure NPC simulation without user interaction. You can also change behaviors and visualisations independently.

The New Kingdoms engine was designed based on the clean architecture principles. In two articles referenced below, you can read the full [story of its design](https://medium.com/better-programming/clean-architecture-in-game-development-e57542a96e5e), understand the [final implementation](https://medium.com/@yankalbaska/how-clean-should-your-architecture-be-b2157eeea737) down to classes, how they depend on each other, and how the engine is intended to be used. There is also a [demo app]({{ site.baseurl }}/samples) to make it easier to start.
