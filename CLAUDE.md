# Claude Code Game Studios — Detective Noir

Indie game development managed through 49 coordinated Claude Code subagents.
Each agent owns a specific domain, enforcing separation of concerns and quality.

## Proyecto

**Nombre**: Limonchero 3D (Detective Noir)
**Género**: Aventura de misterio / Detective Noir
**Plataforma**: PC (Windows / Linux) — Controller o Mouse+Teclado
**Estado**: En desarrollo activo

Juego de rol de detective en primera persona ambientado en un mundo noir. El jugador interroga NPCs con diálogo generado por LLM usando su voz (STT), recoge pistas con press-X, y resuelve crímenes. Los NPCs responden con texto y balbuceo característico (estilo Animal Crossing) — sin TTS.

## Technology Stack

- **Engine**: Godot 4.6
- **Language**: GDScript
- **Version Control**: Git con trunk-based development
- **Build System**: Godot Export Pipeline (Windows/Linux)
- **Asset Pipeline**: Godot import system + assets/ directory
- **AI/LLM**: Servidor Python (server/) con LLM para diálogos de NPCs (localhost)
- **STT**: faster-whisper — solo Speech-to-Text, sin TTS
- **NPC Audio**: Balbuceo procedural local por personaje (sin Piper TTS)

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
