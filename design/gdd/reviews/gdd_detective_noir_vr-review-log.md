# Review Log — GDD Detective Noir VR

## Review — 2026-04-21 — Verdict: MAJOR REVISION NEEDED
Scope signal: XL
Specialists: game-designer, systems-designer, ux-designer, godot-specialist, qa-lead, creative-director
Blocking items: 7 | Recommended: 7
Summary: Review disparado por feedback de profesores: remoción de VR y reemplazo de mecánica UV wand por sistema press-X. El creative-director confirmó que la identidad creativa sobrevive la migración a PC, pero identificó tres problemas estructurales que bloquean el desarrollo: (1) el sistema de evidencia es insolvable sin R3 y sin ruta para testimonios, (2) el codebase tiene bugs críticos pre-existentes (STT no funcional, GameManager sin autoload, XR autoloads mal configurados), (3) el encuadre académico requiere validación del profesor. Los cambios propuestos van en la dirección correcta — el juego en PC es potencialmente más fuerte conceptualmente.
Prior verdict resolved: No — primera revisión del GDD principal.

**Revisiones aplicadas en sesión (v0.3 — 2026-04-22):**
- Plataforma actualizada a PC Windows/Linux; OpenXR/XR Tools removido del stack
- R3 rediseñado: Encendedor de Oro (press-X Zona 5 + confirmación de Moni vía diálogo)
- R2 canonizado en guardarropa Zona 1 (level doc es autoritativo)
- R6 demotado a señal visual atmosférica (no coleccionable)
- Sistema de testimonios definido: prompt "¿Agregar como evidencia? [X]" en líneas clave (R4, R5)
- Controles reescritos para PC (WASD/mouse + controller)
- Menú contextual NPC añadido (Interrogar / Examinar) para resolver ambigüedad press-X
- Flujo de acusación definido: árbol de diálogo tipo Ace Attorney con hasta 3 pruebas
- Estructura de proyecto actualizada (sin carpeta vr/, con player/ y ui/)
- Pipeline STT actualizado a localhost + AudioEffectCapture
- §8 UI/UX reescrito de VR a PC (HUD 2D, pop-up Gajito, inventario Tab)
- RNF-01/03/05 actualizados (60 FPS PC, localhost detection, FOV slider)

**Pendiente (no resuelto en GDD — requiere acción externa):**
- Bugs de codebase: GameManager autoload, voice_manager STT, XR autoloads → Migration Sprint
- Validación académica: confirmar con profesor que STT+LLM+TTS es suficiente como tecnología emergente
