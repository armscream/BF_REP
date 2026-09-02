# BF_REP - Bifrost Replication Module

BF_REP provides the replication framework for Bifrost Engine, it is intended to be used in conjunction with BF_ECS and BF_ENET which is the backend for the netcode.

## Installation
- To install BF_REP, simply clone the repository into your project's `modules` directory.
- In your project's directory, run ./rune manifest to generate a manifest file for this module, if you don't have one already.
- Add the following to your project's manifest file <project.toml> in the modules section:
[[modules]]
name = "BF_REP"
enabled = true
required = true
version = { major = 0, minor = 0, patch = 1 }
- Run ./rune run <DEBUG/RELEASE/EDITOR>

## Features
- Adds RPCs and Events.
- Replication component that can be added to an Entity, and allows the programmer to define which of that entity's components should be replicated, and their replication policies. This allows for essentially drag-and-drop replication, which simplifies the entire process significantly over other Engine's APIs. Dirty component tracking is automatic and will be collected into a command buffer throughout the frame.
- Replication Systems will flush replication command buffers in the Post-Update phase into a single packet by default, but their is an option to set the rep policy to IMMEDIATE, which will send that packet within that frame, - only recommended for things that need to be the lowest latency: i.e: Firing a weapon.
- Interest-based replication using the chunk/cell-based spatialization system, and other defines as well, this reduces unnecessary packets.

## Current State
- Planned, but not implemented.

## License
- Just as all Core Modules, this module inherets Bifrost Engine's licensing agreement.