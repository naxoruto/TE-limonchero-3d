# Plan de Trabajo — "Detective Noir VR"
## Proyecto Semestral ICI5442 – Tecnologías Emergentes

> **Tecnologías:** LLM (Chatbot con NPC) + Realidad Virtual (VR)  
> **Género:** Noir / Detective  
> **Plataforma:** Meta Quest 2 (proporcionado por la universidad)  
> **Motor:** Godot 4 + OpenXR + XR Tools  
> **Equipo:** Ignacio Cuevas, Martin Cevallos, Sofia Meza, Diego Espinosa  
> **Deadline final:** Finales de junio 2026  

---

## Opiniones y Observaciones sobre la Idea

### ✅ Fortalezas
- **Encaje perfecto con la rúbrica:** LLM + VR cubre los dos pilares exigidos (LLM + tecnología emergente).
- **Narrativa clara:** El género noir/detective da una estructura natural de gameplay (buscar pistas → interrogar → acusar).
- **Speech-to-text en VR** es un diferenciador potente de inmersión y demuestra dominio técnico avanzado.
- **Componente educativo:** El core del juego es en INGLÉS (jugador y NPCs). El asistente de IA monitoriza la voz del jugador y corrige sus errores gramaticales en español. Es un ángulo de aprendizaje activo muy potente.
- **Godot 4 es ideal para Quest 2** con soporte oficial Meta vía OpenXR.

### ⚠️ Puntos a Considerar
1. **Godot 4 + VR en Quest 2:** Godot 4 soporta OpenXR de forma nativa. El plugin XR Tools provee utilidades VR (locomoción, manos, interacciones) listas para usar con Meta Quest 2.
2. **Entornos locales:** Si quieren evitar un servidor cloud, se puede usar un backend local (Python/Flask) como proxy al LLM, o incluso un modelo local como **Ollama** (llama3, mistral, etc.) para desarrollo. Para la demo final, una API como OpenAI/Gemini dará mejores respuestas.
3. **Latencia del LLM:** Las respuestas deben ser rápidas para no romper la inmersión. Usar streaming y modelos ligeros (GPT-4o-mini, Gemini Flash, o modelos locales vía Ollama).
4. **Speech-to-Text:** Whisper de OpenAI (se puede ejecutar localmente con `whisper.cpp` o `faster-whisper`) para no depender de la nube.
5. **Text-to-Speech:** Para entornos locales, opciones como `Piper TTS` (offline, ligero) o `Coqui TTS`. Para mejor calidad: ElevenLabs o Azure TTS (requiere internet).
6. **Alcance:** Un solo caso policial (1 escena principal, 3-4 NPCs, 5-8 pistas) es suficiente. No intentes múltiples casos.
7. **Deploy a Quest 2:** Godot exporta a Android nativo con las plantillas de OpenXR.

---

## Cronograma General

> Basado en fecha actual (abril 2026) y deadline finales de junio 2026.

| Fase | Periodo | Semanas | Hito |
|------|---------|---------|------|
| **Fase 1** – Diseño + PoC | 7 abr – 27 abr | ~3 sem | **Entrega 1:** Informe diseño + prototipo básico |
| **Fase 2** – Desarrollo 70% | 28 abr – 1 jun | ~5 sem | **Entrega 2:** Demo funcional + diseño de pruebas |
| **Fase 3** – Final + Validación | 2 jun – 29 jun | ~4 sem | **Entrega 3:** Build final + resultados pruebas |

---

## FASE 1 — Diseño y Prueba de Concepto (7 abr – 27 abr)

### Distribución sugerida por integrante

| Integrante | Rol principal | Tareas Fase 1 |
|------------|--------------|---------------|
| **Ignacio Cuevas** | Líder técnico / VR | Configurar proyecto Godot 4 + OpenXR + XR Tools, lograr escena VR mínima en Quest 2 |
| **Martin Cevallos** | Backend / LLM | Montar servidor local (Python), integrar API LLM, crear prompts de NPCs en inglés |
| **Sofia Meza** | Audio / STT+TTS | Integrar Whisper (STT) + motor TTS, pipeline de audio funcional |
| **Diego Espinosa** | Documentación / Diseño | Objetivos, metodología, EDT, Gantt, diagramas UML, mockups |

### Entregables Fase 1

| # | Actividad | Entregable |
|---|-----------|-----------|
| 1 | Definir objetivos generales y específicos | Sección en informe |
| 2 | Seleccionar y justificar metodología (ej. Scrum adaptado) | Sección en informe |
| 3 | Elaborar EDT (3 niveles) + Carta Gantt detallada | EDT + Gantt |
| 4 | Diseñar arquitectura del sistema (Unity ↔ Backend local ↔ LLM ↔ STT/TTS) | Diagrama de arquitectura |
| 5 | Listar requisitos funcionales y no funcionales | Tabla RF/RNF |
| 6 | Crear diagrama de casos de uso | Diagrama UML |
| 7 | Crear mockups de vistas principales en VR | Mockups |
| 8 | Diagramas de secuencia (interrogar NPC, buscar pista, acusar) | Diagramas UML |
| 9 | Diagrama ER (datos del caso, pistas, NPCs) | Diagrama ER |
| 10 | **Prototipo básico funcional:** Escena VR en Godot 4 con 1 NPC que responda vía LLM usando voz (en inglés) | Build APK + video |

**Prueba de concepto técnica (lo más importante):**
```
Micrófono Quest 2 → Whisper (STT local detecta inglés) → LLM (recibe prompt en inglés) → Respuesta texto inglés → Panel world-space en NPC dentro de Godot XR
                                                       → LLM Asistente (Gajito) evalúa gramática → Corrección en español si hay error
```

---

## FASE 2 — Desarrollo Core al 70% (28 abr – 1 jun)

| # | Actividad | Entregable |
|---|-----------|-----------|
| 1 | Construir entorno 3D noir (El Agave y La Luna - una escena única) | Escena Godot |
| 2 | Implementar locomoción VR (teletransporte + continua) via Godot XR Tools (OpenXR) | Sistema de movimiento |
| 3 | Sistema de pistas (objetos interactuables, inventario VR) | Mecánica de gameplay |
| 4 | 3-4 NPCs con prompts únicos EN INGLÉS (personalidad, coartada, info del crimen) | Sistema de NPCs |
| 5 | Asistente LLM (Evaluador de Gramática) en español | Chatbot auxiliar |
| 6 | Flujo completo: explorar → pistas → interrogar → acusar | Gameplay loop |
| 7 | Diseñar pruebas con usuarios (escenarios, cuestionarios SUS, IMI/AEQ) | Doc de pruebas |
| 8 | Definir prueba piloto (condiciones, cuestionario pre/post) | Protocolo |
| 9 | Actualizar Gantt con control de cambios | Gantt v2 |
| 10 | **Video demo** mostrando avance funcional | Video MP4 |

---

## FASE 3 — Software Final y Validación (2 jun – 29 jun)

| # | Actividad | Entregable |
|---|-----------|-----------|
| 1 | Corregir observaciones de la Entrega 2 | Informe de correcciones |
| 2 | Pulir entorno 3D (iluminación noir, sonido ambiente, partículas) | Escenas finales |
| 3 | Optimizar rendimiento VR (≥72 FPS en Quest 2) | Build optimizado |
| 4 | Completar todas las funcionalidades comprometidas | Prototipo completo |
| 5 | Ejecutar pruebas con usuarios reales con Quest 2 | Datos de pruebas |
| 6 | Grabar video/fotos de la experiencia del usuario | Evidencia audiovisual |
| 7 | Aplicar cuestionarios pre y post experiencia | Resultados tabulados |
| 8 | Generar APK final para Quest 2 | APK ejecutable |
| 9 | **Video demo** del prototipo final completo | Video MP4 |
| 10 | Entregar código fuente documentado | Repositorio Git |

---

## Stack Tecnológico

| Componente | Tecnología | Notas |
|------------|-----------|-------|
| **Motor 3D** | Godot 4 + OpenXR + XR Tools | Open-source, soporte nativo OpenXR |
| **VR SDK** | Meta Quest (OpenXR) | Locomoción, manos, interacciones vía OpenXR |
| **Quest 2 Export** | Android Export Template (Godot) | APK nativo para Quest 2 |
| **LLM (desarrollo)** | Ollama (llama3 / mistral) local | Sin costo, funciona offline |
| **LLM (demo final)** | OpenAI GPT-4o-mini o Gemini Flash | Mejor calidad para presentación |
| **Speech-to-Text** | faster-whisper (local) | Modelo medium, ejecuta STT enfocado en inglés nativo/acentuado |
| **Text-to-Speech** | No aplica para NPCs — responden con texto | NPCs muestran texto en panel world-space |
| **Backend local** | Python + FastAPI | Proxy entre Godot y los servicios de IA |
| **Assets 3D** | Godot Asset Library / Kenney.nl / itch.io | Estilo low-poly noir |
| **Control de versiones** | Git + GitHub/GitLab | Obligatorio para entrega |
| **Idioma del juego** | INGLÉS (NPCs responden en texto; jugador habla en inglés), ESPAÑOL (Ayudante Gajito y UI) | — |
| **Asistente de idioma** | LLM evaluador (Gajito) que analiza el STT del jugador y corrige errores de gramática/vocabulario en español | Si el STT saca "I is happy", Gajito interrumpe y corrige |
