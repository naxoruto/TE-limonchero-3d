# Claude Code Game Studios — Detective Noir VR

Indie game development managed through 49 coordinated Claude Code subagents.
Each agent owns a specific domain, enforcing separation of concerns and quality.

## Proyecto

**Nombre**: Limonchero 3D (Detective Noir VR)
**Género**: Aventura de misterio / Detective Noir en VR
**Plataforma**: Meta Quest 2
**Estado**: En desarrollo activo

Juego de rol de detective en primera persona ambientado en un mundo noir. El jugador interroga NPCs con diálogo generado por LLM, recoge pistas físicas en VR, y resuelve crímenes usando voz (STT/TTS).

## Technology Stack

- **Engine**: Godot 4.6
- **Language**: GDScript
- **Version Control**: Git con trunk-based development
- **Build System**: Godot Export Pipeline (Android/APK para Quest 2)
- **Asset Pipeline**: Godot import system + assets/ directory
- **XR**: OpenXR (Meta Quest 2)
- **AI/LLM**: Servidor Python (server/) con LLM para diálogos de NPCs
- **STT/TTS**: Integrado en el servidor de IA

> **Agentes de motor activos**: Godot 4 specialists (godot-specialist, godot-gdscript-specialist, godot-shader-specialist)
> Los agentes de Unity y Unreal NO aplican a este proyecto.

## Project Structure

@.claude/docs/directory-structure.md

## Engine Version Reference

@docs/engine-reference/godot/VERSION.md

## Technical Preferences

@.claude/docs/technical-preferences.md

## Coordination Rules

@.claude/docs/coordination-rules.md

## Collaboration Protocol

**User-driven collaboration, not autonomous execution.**
Every task follows: **Question -> Options -> Decision -> Draft -> Approval**

- Agents MUST ask "May I write this to [filepath]?" before using Write/Edit tools
- Agents MUST show drafts or summaries before requesting approval
- Multi-file changes require explicit approval for the full changeset
- No commits without user instruction

See `docs/COLLABORATIVE-DESIGN-PRINCIPLE.md` for full protocol and examples.

## Coding Standards

@.claude/docs/coding-standards.md

## Context Management

@.claude/docs/context-management.md
