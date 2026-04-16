# Technical Preferences

<!-- Configured for: Limonchero 3D (Detective Noir VR) — Godot 4.6 + Meta Quest 2 -->
<!-- All agents reference this file for project-specific standards and conventions. -->

## Engine & Language

- **Engine**: Godot 4.6
- **Language**: GDScript
- **Rendering**: Mobile renderer (optimizado para Quest 2), Forward+ para PC dev
- **Physics**: Jolt (default en Godot 4.6)

## Input & Platform

- **Target Platforms**: Meta Quest 2 (Android/APK), PC (desarrollo)
- **Input Methods**: VR Controllers (Touch), Voice (STT)
- **Primary Input**: VR Controllers (Meta Quest 2 Touch)
- **Gamepad Support**: None (VR only)
- **Touch Support**: None
- **Platform Notes**: OpenXR con Meta Quest 2. Interacción física en VR (agarrar objetos, señalar). Voz via STT server-side. Sin teclado/ratón en build final.

## Naming Conventions

- **Classes**: PascalCase (ej: `DetectiveController`, `NPCDialogueManager`)
- **Variables**: snake_case (ej: `current_clue`, `is_interrogating`)
- **Signals/Events**: snake_case con verbo pasado (ej: `clue_collected`, `dialogue_started`)
- **Files**: snake_case (ej: `detective_controller.gd`, `npc_dialogue.tscn`)
- **Scenes/Prefabs**: snake_case (ej: `main_scene.tscn`, `suspect_npc.tscn`)
- **Constants**: UPPER_SNAKE_CASE (ej: `MAX_CLUES`, `DIALOGUE_TIMEOUT`)

## Performance Budgets

- **Target Framerate**: 72 FPS (Quest 2 minimum), 90 FPS objetivo
- **Frame Budget**: ~11ms @ 90fps
- **Draw Calls**: < 100 por frame en Quest 2
- **Memory Ceiling**: < 3.5 GB RAM (Quest 2 tiene 6GB total)

## Testing

- **Framework**: GUT (Godot Unit Testing) si se implementa
- **Minimum Coverage**: Sistemas críticos (diálogo LLM, detección de pistas)
- **Required Tests**: Pipeline STT→LLM→TTS, lógica de pistas

## Forbidden Patterns

- No referencias directas UI en scripts de gameplay
- No valores hardcodeados para timing de animaciones o diálogo (usar constantes/exports)
- No polling en _process() cuando se puede usar signals

## Allowed Libraries / Addons

- **OpenXR Tools** (addons/godot-openxr-vendors o similar)
- **GUT** — Godot Unit Testing (opcional)

## Architecture Decisions Log

- [No ADRs yet — usar /architecture-decision para crear uno]

## Engine Specialists

- **Primary**: `godot-specialist`
- **Language/Code Specialist**: `godot-gdscript-specialist`
- **Shader Specialist**: `godot-shader-specialist`
- **UI Specialist**: `ui-programmer` (con contexto XR/VR)
- **Additional Specialists**: `ai-programmer` (para integración LLM/STT/TTS)
- **Routing Notes**: Todo código XR/VR va al godot-specialist primero. Diálogos e IA van al ai-programmer.

### File Extension Routing

| File Extension / Type | Specialist to Spawn |
|-----------------------|---------------------|
| `.gd` (GDScript) | `godot-gdscript-specialist` |
| `.gdshader` / `.shader` | `godot-shader-specialist` |
| `.tscn` (UI screens) | `ui-programmer` |
| `.tscn` (scenes/levels) | `godot-specialist` |
| `.tres` / resources | `godot-specialist` |
| IA / LLM / STT / TTS | `ai-programmer` |
| General architecture review | `godot-specialist` |
