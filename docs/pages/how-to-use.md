---
layout: default
title: How to use
permalink: /how-to-use/
nav_order: 1
---
# How to use
New Kingdoms helps rapidly iterate iOS games prototyping. It requires minimum effort to publish the game on an iOS device (together with [template-love-game](https://github.com/kujunda-seda/template-love-game) repository) and allows you to think of objects and their behaviours as in real life. You will need basic programming skills to code in Lua and advanced ability to analyze and model your objects and game rules. With all capabilities of the LÖVE engine you can easily create visual representation to see the objects' life unfold.

You can skip visualisation and use CLI output if you want pure NPC simulation without user interaction. You can also change behaviors and visualisations independently.

## Where to edit what / Folder structure 
The folder layout is organized by “place of change” (often to rare):

1. Change visuals or visual-related feedback: `src/ui/` _(often)_
2. Change how model state becomes screen views: `src/app/GameLayout.lua`
3. Change input mapping to game actions: `src/app/GameController.lua`
4. Change inter-object gameplay rules, turn logic: `src/app/GameRules.lua`
5. Change game world elements' behavior: `src/entities/`
6. Change internal "heartbeat" coordination: `src/engine/Engine.lua`
7. Change LÖVE framewok, only in: `src/main.lua`, `src/conf.lua`, `src/ui/`
8. Change core primitives, why?:) : `src/core/`
9. Change shared independent value helpers, per need: `src/shared/` _(rare)_

## Architectural intent
This project follows a pragmatic Clean Architecture split: keep gameplay rules/model independent from rendering/runtime, and keep framework/UI concerns at the edges. There is also a [class dependencies diagram on GitHub](https://github.com/kujunda-seda/new-kingdoms/blob/master/class-dependencies.mmd).

### Clean architecture mapping

- Entities (inner): `src/entities/`
- Use cases / application rules (inner-ish): `src/app/GameRules.lua`
- Interface adapters (outer-ish): `src/app/GameLayout.lua`, `src/app/GameController.lua`, `src/ui/`
- Frameworks & drivers (outermost): `src/engine/Engine.lua`, `src/main.lua`, `src/app/compose.lua`

#### Important decisions:
- Entities and rules should NOT know about UI/rendering.
- The engine stays reusable by depending ONLY on the minimal interfaces (Ruleset/Layout/Controller) and `core` primitives.
- Layout and Controller are allowed to know both Entities + Views because they are adapters.

### Dependency rules

#### Rules of thumb:
1. if you’re editing `core` or `engine`, it should still make sense for another game.
2. if it would still make sense in a headless simulation, it’s not layout/controller.
3. if it still makes sense without something higher-level (outer ring, abstracted), put it below (inner ring).

#### Allowed directions (conceptual):
- `core` → depends on nothing else in `src/`
- `entities` → may depend on `core`, `shared`
- `engine` → may depend on `core` only (runtime host + contracts)
- `ui` → may depend on `core`, `shared`
- `app/GameRules.lua` → may depend on `entities`, `core`, `shared` (no `ui`)
- `app/GameLayout.lua`, `app/GameController.lua` → may depend on `entities`, `ui`, `core`, `shared` (they are adapters)
- `main`/`compose` → may depend on everything (composition root)

## History of development

In two articles referenced below, you can read the full [story of its design](https://medium.com/better-programming/clean-architecture-in-game-development-e57542a96e5e), understand the [final implementation](https://medium.com/@yankalbaska/how-clean-should-your-architecture-be-b2157eeea737) down to classes, how they depend on each other, and how the engine is intended to be used. There is also a [demo app]({{ site.baseurl }}/samples) to make it easier to start (based on v0.1), but it is not updated for the latest version of the engine.
