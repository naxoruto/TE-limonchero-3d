# Review Log — El Agave y La Luna

## Review — 2026-04-21 (segunda vuelta) — Verdict: MAJOR REVISION NEEDED → revisiones aplicadas en sesión

Scope signal: XL
Specialists: game-designer, systems-designer, qa-lead, narrative-director, level-designer, ai-programmer, ux-designer, godot-specialist, creative-director
Blocking items: 12 | Recommended: 8
Summary: La revisión completa con 8 especialistas reveló que la capa estructural del documento nunca fue auditada en la primera vuelta. Tres fallas de pillar: el stain bloom resolvía el misterio visualmente, el gate de acusación aceptaba stamps sin comprensión causal, y Gajito nombraba al asesino. También se encontraron contradicciones entre §3.3 y el Cast Bible (frontera lingüística), entre NPC-03 y §5.5 (T2 gating), y riesgos de performance (draw calls crowd, UV shader en Mobile renderer). Todos los bloqueantes fueron resueltos en sesión: stain rediseñado, Gajito coaching reescrito, gates de Zona 3/6 añadidos, ACs de accesibilidad formalizados en §10, timer semantics clarificados, Cast Bible actualizado con nota E4.
Prior verdict resolved: Sí — primera vuelta resuelta; esta es la auditoría de especialistas completa.

## Review — 2026-04-21 — Verdict: MAJOR REVISION NEEDED → revisiones aplicadas en sesión

Scope signal: L
Specialists: game-designer, systems-designer, qa-lead, narrative-director, creative-director
Blocking items: 12 | Recommended: 6
Prior verdict resolved: No — primera revisión

Summary: El creative-director confirmó que la fantasía del jugador ("proceso es justicia / disciplina") estaba rota porque el gate de acusación era un lock, no una elección. Los sistemas-designer y qa-lead identificaron independientemente el error en CP-03 (estado y hold time incorrectos) y un softlock de libreta. La narrative-director detectó contradicciones entre el Cast Bible y el level doc (ruta F2) y un problema de secuenciación con T2.

**Resueltos en esta sesión (10 de 12 bloqueantes):**
- Gate de acusación: ahora permite acusar en cualquier momento; acusar sin evidencia → final malo B1
- Barry's opening line: bloqueado a "siempre antes de Spud"
- T2 de Moni: ungated (funciona como lead, no como confirmación)
- CP-03: corregido a "estado 1, hold 3s"
- Softlock libreta: definida mecánica de descarte de slots
- UV wand softlock (skip Zona 2): ACC-05 añadido, Gajito ofrece wand en Zona 4
- Contradicción puerta Zona 5/6: resuelta con claridad de qué lado tiene manija
- Prioridad gate (F1+F2+F3 AND F4/F5): orden de evaluación explícito
- LLM recibe stamps de F1/F2/F3, no solo inventario
- F2 ruta por interrogatorio eliminada del Cast Bible (solo ruta física)

**Pendientes / advisory:**
- Estado 1 de manchas es ghost state (advisory — no impide implementación)
- NPC-06 threshold medible para "respuesta coherente" (debe definirse antes de QA formal)
- B3/B4 definiciones individuales pendientes de confirmación con game designer
- Easter egg E4 muddies el móvil (advisory — no bloqueante en Fase 1)
- Gerry's "Maybe" necesita expansión en el prompt LLM para constituir T3 accionable
