# 🎮 Game Design Document (GDD)
## "Detective Noir VR" — *Working Title*

> **Estado:** Plantilla/Borrador  
> **Versión:** 0.2  
> **Fecha:** 6 de abril de 2026  
> **Equipo:** 4 integrantes — Ignacio Cuevas, Martin Cevallos, Sofia Meza, Diego Espinosa  
> **Asignatura:** ICI5442 – Tecnologías Emergentes  
> **Motor:** Godot 4 + OpenXR + XR Tools  
> **Plataforma:** Meta Quest 2  

---

## 1. Visión General

### 1.1. Concepto del Juego
Un juego de detectives en primera persona en Realidad Virtual donde el jugador investiga un crimen. Debe explorar escenarios, recoger pistas e interrogar sospechosos controlados por un LLM con personalidades únicas, usando su propia voz (Speech-to-Text). El entorno general y la interfaz están en español, pero **todos los NPCs hablan en inglés**, y **el jugador está obligado a hablar en inglés** para interrogar. Un asistente de IA integrado escucha al jugador y, si se equivoca, salta para corregir los errores e indicarle cómo debió decirlo. El objetivo es descubrir al culpable y presentar tu caso al jefe.

### 1.2. Género
Noir / Detective / Misterio / Aventura narrativa

### 1.3. Plataforma
- **Meta Quest 2** (standalone, proporcionado por la universidad)

### 1.4. Audiencia Objetivo
- Jugadores de VR interesados en narrativa e inmersión
- Personas que quieran practicar inglés en un contexto interactivo e inmersivo

### 1.5. Propuesta de Valor Única (USP)
La primera experiencia VR noir donde cada interrogatorio es único gracias a IA generativa con voz, y además te enseña inglés de forma natural.

### 1.6. Componente Educativo
La interfaz general (menús, inventario) y la voz del ayudante están en **español**, pero el contenido core del juego está en **inglés**. 
- Los NPCs hablan 100% en inglés.
- El jugador (mediante detección de voz) **debe** hablar e interrogar en inglés.
- **Mecánica de corrección:** El ayudante LLM analiza lo que el jugador acaba de decir (Speech-to-Text). Si el jugador comete un error gramatical o de pronunciación grave, el ayudante interviene de inmediato y le dice (en español) en qué se equivocó y cómo debió decir la frase correctamente.

---

## 2. Gameplay

### 2.1. Core Loop (Bucle Principal)
```
Explorar escenario → Encontrar pistas → Interrogar sospechosos (voz) → Formular hipótesis → Acusar ante el jefe
```

### 2.2. Mecánicas Principales

| Mecánica | Descripción | Prioridad |
|----------|------------|-----------|
| Exploración VR | Moverse por el escenario en primera persona | 🔴 Alta |
| Recolección de pistas | Interactuar con objetos para recoger evidencia | 🔴 Alta |
| Interrogatorio por voz | Hablar con NPCs usando micrófono; el NPC responde en **texto** vía LLM | 🔴 Alta |
| Inventario de pistas | Sistema para revisar las pistas encontradas | 🟡 Media |
| Acusación final | Presentar pruebas y nombrar al culpable al jefe | 🔴 Alta |
| Asistente de inglés | LLM auxiliar para aprendizaje de inglés contextual | 🟡 Media |
| `[Otra mecánica]` | `[TODO]` | `[TODO]` |

### 2.3. Controles VR (Meta Quest 2)

| Acción | Control Quest 2 |
|--------|----------------|
| Moverse | Joystick izquierdo (continuo) o teletransporte |
| Girar vista | Joystick derecho (snap turn 45°) |
| Agarrar objetos/pistas | Grip button (mano) |
| Interactuar con NPC | Acercarse + Trigger button |
| Hablar (STT) | Mantener presionado A/X o activación por proximidad |
| Abrir inventario de pistas | Botón menú o gesto (mirar la muñeca) |
| Llamar asistente de inglés | Automático (cuando el jugador comete un error) o botón Y/B |

### 2.4. Flujo de una Partida
```mermaid
flowchart TD
    A[Inicio: Briefing del jefe] --> B[Explorar escena del crimen]
    B --> C[Buscar y recoger pistas]
    C --> D{¿Suficientes pistas?}
    D -->|No| B
    D -->|Sí| E[Ir a sala de interrogatorio]
    E --> F[Interrogar sospechoso 1]
    E --> G[Interrogar sospechoso 2]
    E --> H[Interrogar sospechoso 3]
    F & G & H --> I[Analizar información]
    I --> J{¿Listo para acusar?}
    J -->|No| B
    J -->|Sí| K[Hablar con el jefe y acusar]
    K --> L{¿Acertó?}
    L -->|Sí| M[🎉 Caso resuelto]
    L -->|No| N[❌ Caso fallido]
```

---

## 3. Narrativa

> **Referencia completa:** `design/narrative/cast-bible.md` (personajes) y `design/narrative/world-rules.md` (reglas del universo)

### 3.1. Ambientación
Ciudad ficticia estadounidense de estilo años 50 — noches lluviosas, jazz, neones, humo de palillo de canela. El mundo está habitado **íntegramente por frutas y verduras antropomórficas** (no hay humanos). El caso transcurre en el interior del club nocturno **"El Agave y La Luna"**, durante la noche de su gala anual. Neón verde aceituna, olor a naranja confitada, un piano en el escenario y un cadáver en la oficina del dueño.

### 3.2. Historia del Caso: *"La Última Nota en El Agave y La Luna"*

**La víctima:** Cornelius "Corn" Maize (61 años), mazorca de maíz, dueño del club. Hallado muerto de un disparo en su oficina del piso de arriba durante la gala anual.

**La verdad:** Bartholomew "Barry" Peel (plátano, 34 años) mató a Corn. El padre de Barry lo declaró públicamente indigno del apellido antes de morir y puso el fideicomiso familiar bajo control de Cornelius. Durante tres años, Barry tuvo que pedirle permiso a Corn para acceder a su propia herencia mientras era humillado en privado. Esa noche, Barry descubrió que el acuerdo de "liberación" que Corn le presentó era una trampa — cederle el 40% de la empresa bananera. Subió al piso de arriba, confrontó a Corn, y cuando Corn se negó, lo disparó. **Móvil: duelo e identidad, no codicia.** Barry mató para firmar su propio nombre por primera vez.

**Eco narrativo del clímax:** Al inicio Barry le dice a Limoncito: *"My father always said: a man who can't sign his own name isn't a man at all. Tonight I finally understand what he meant."* Al final, confrontado con las pruebas: *"I signed mine tonight. Just not on paper."* Limonchero reconoce que lo supo desde el principio — eligió seguir el proceso de todas formas porque acusar sin pruebas no es justicia.

---

### 3.3. Personajes

#### El Jugador — Limonchero
| Campo | Valor |
|-------|-------|
| Fruta | Limón amarillo grande |
| Trasfondo | El mejor detective de Latinoamérica. Ex-jefe del escuadrón de agentes en cubierto más grande de LATAM. |
| Motivación | Ambición legítima: busca nuevos retos. EE.UU. es el siguiente nivel. |
| Idioma | No habla inglés — se comunica en español con Limoncito |

---

#### NPC Asistente: Limoncito
| Campo | Valor |
|-------|-------|
| Fruta | Limón de pica (key lime) — más pequeño, más ácido |
| Rol | Traductor oficial asignado. Asistente de apoyo al jugador. |
| Función | Sugiere cómo formular preguntas, aclara respuestas de NPCs, da contexto cultural. El jugador habla directamente en inglés — Limoncito apoya, no reemplaza. |
| Idioma | Español (con Limonchero) / Inglés (con NPCs cuando traduce) |
| Personalidad | Energético, hiperpreparado, habla de más cuando está nervioso. Admira a Limonchero y lo encuentra imposible en partes iguales. |
| Prompt base LLM | `Eres Limoncito, asistente oficial del detective Limonchero. Hablas con él en ESPAÑOL. Cuando el jugador comete un error gramatical en inglés, lo corriges de forma irónica pero constructiva. También puedes sugerir cómo formular preguntas a los NPCs y dar contexto sobre el caso. Nunca reveles al culpable directamente.` |

---

#### NPC Autoridad: Commissioner Wallace Beet
| Campo | Valor |
|-------|-------|
| Fruta | Betabel (remolacha) |
| Rol | Asigna el caso al inicio. Recibe la acusación final. Evalúa si es correcta. |
| Personalidad | Impaciente, condescendiente. Ya tiene un sospechoso en mente (Gerry). Quiere cerrar el caso antes de medianoche. |
| Idioma | Solo inglés |
| Prompt base LLM | `You are Commissioner Beet. You speak ONLY IN ENGLISH. You are impatient and condescending. You want a quick arrest. If presented with a suspect and evidence, you accept. If no suspect by midnight, you arrest Gerry yourself.` |

---

#### Sospechoso 1: Vivienne "Vivi" Tangerine — La Cantante
| Campo | Valor |
|-------|-------|
| Fruta | Mandarina |
| Nombre | Vivienne "Vivi" Tangerine, 29 años |
| Relación con la víctima | Cantante principal. Corn la tenía chantajeada con su pasado (orden de búsqueda por legítima defensa). |
| Personalidad | Gentileza exagerada como técnica de control. Sonrisa que no llega a los ojos. |
| Lo que oculta | Planeaba escapar esa noche — maleta escondida en la cocina. Su reacción al saber de la muerte fue alivio, lo cual la hace parecer culpable. |
| ¿Es culpable? | **No** |
| Coartada | Camerino 9:45–10:30 PM. Verificable, con hueco de ~20 minutos. |
| Prompt LLM | `You are Vivi Tangerine. You speak ONLY IN ENGLISH. You are warm and composed. You deny any conflict with Cornelius. If asked about the 20-minute gap, you say you needed air. If the detective mentions the kitchen or a dark coat, you tense briefly before recovering.` |

---

#### Sospechoso 2: Gerald "Gerry" Broccolini — La Seguridad
| Campo | Valor |
|-------|-------|
| Fruta | Brócoli |
| Nombre | Gerald "Gerry" Broccolini, 44 años |
| Relación con la víctima | Seguridad del club, 5 años trabajando para Corn. |
| Personalidad | Monosilábico. No miente — omite. |
| Lo que oculta | Abandonó su puesto 22 minutos para encontrarse con su hermana (en protección de testigos). Sabe que alguien pudo entrar por la puerta trasera. |
| ¿Es culpable? | **No** |
| Coartada | "Fui al baño." Sin verificación. |
| Prompt LLM | `You are Gerry Broccolini. You speak ONLY IN ENGLISH. Answer in one or two words when possible. You say you were in the bathroom. If asked directly whether someone could have entered the back door while you were gone, pause, then say: "Maybe." You will not explain why you were gone.` |

---

#### Sospechoso 3: Dolores "Lola" Persimmon — La Contadora
| Campo | Valor |
|-------|-------|
| Fruta | Caqui |
| Nombre | Dolores "Lola" Persimmon, 51 años |
| Relación con la víctima | Contadora del club, 8 años. Conoce cada irregularidad contable de Corn. |
| Personalidad | Cooperativa en exceso — responde todo con detalle, lo cual es en sí mismo sospechoso. |
| Lo que oculta | Desviaba fondos para financiar una demanda civil contra Corn. Esa noche quemó los documentos en el baño al enterarse de la muerte. |
| ¿Es culpable? | **No** |
| Coartada | Oficina contable 9:45–10:47 PM. Hueco de 28 minutos entre 9:47 y 10:12 PM. |
| Prompt LLM | `You are Lola Persimmon. You speak ONLY IN ENGLISH. You are helpful and detailed. You account for your evening precisely except for 9:47–10:12 PM, where you say you "stepped away briefly." Do not mention the documents or the lawsuit. If pressed about financial records, redirect calmly: "Everything is in order."` |

---

#### Sospechoso 4: Bartholomew "Barry" Peel *(culpable)*
| Campo | Valor |
|-------|-------|
| Fruta | Plátano |
| Nombre | Bartholomew "Barry" Peel, 34 años |
| Relación con la víctima | Corn administraba su fideicomiso familiar y lo humillaba desde hacía 3 años. |
| Personalidad | Serenidad absoluta. Piel amarilla y lisa. Manchas oscuras en las manos que aparecen gradualmente. |
| Lo que oculta | Subió al piso de arriba ~22:00, confrontó a Corn, lo disparó cuando Corn se negó a liberar el fideicomiso sin condiciones. |
| ¿Es culpable? | **Sí** |
| Coartada | Afirma haber estado en su reservado toda la noche. |
| Condición de confesión | Solo confiesa con las tres pruebas simultáneas: acuerdo del fideicomiso (rasgado) + llave maestra + evidencia de pólvora en muñeca. |
| Prompt LLM | `You are Barry Peel. You speak ONLY IN ENGLISH. You are calm, well-dressed, and polite. You describe your relationship with Cornelius as "business." You deny being upstairs. You only crack if presented simultaneously with the trust document, the master key, and evidence of gunpowder residue.` |

---

### 3.4. Listado de Pistas

> Las pistas se dividen en **reales** (relevantes para resolver el caso) y **distractores** (objetos sospechosos pero sin relación con el crimen). El jugador debe discernir cuáles importan.

#### Pistas Reales

| # | Pista | Ubicación | Relevancia | Conecta con |
|---|-------|-----------|-----------|-------------|
| R1 | **El Acuerdo del Fideicomiso** — Documento rasgado y re-doblado que Barry debía firmar esa noche. Ceder el 40% de su empresa era una trampa | Reservado privado de Barry | 🔴 Alta | Barry (móvil) |
| R2 | **La Llave Maestra** — Llave del piso de arriba encontrada en el bolsillo interior del saco de Barry | Saco de Barry (inspección directa) | 🔴 Alta | Barry (acceso a la oficina) |
| R3 | **La Mancha de Pólvora** — Cubierta con talco en la muñeca derecha de Barry. Visible bajo luz UV | Muñeca de Barry | 🔴 Alta | Barry (disparó el arma) |
| R4 | **El Testimonio de Vivi** — Vio a alguien "con traje amarillo" subir las escaleras hacia el piso de arriba ~22:00 | Camerino / conversación con Vivi | 🔴 Alta | Barry (lo ubica en el piso de arriba) |
| R5 | **La Puerta Trasera** — Gerry abandonó su puesto 22 minutos. Alguien pudo entrar sin ser visto | Puerta trasera / testimonio de Gerry | 🟡 Media | Ruta alternativa de acceso |
| R6 | **Las Manchas en las Manos de Barry** — Manchas oscuras que aparecen gradualmente en sus manos durante la noche | Observación directa de Barry | 🟡 Media | Barry (señal visual de culpa) |
| R7 | **Los Documentos Quemados** — Ceniza en el baño de empleados. Lola quemó algo esa noche | Baño de empleados | 🟡 Media | Lola (actividad sospechosa, pero no el crimen) |

#### Distractores

| # | Distractor | Ubicación | Por qué confunde |
|---|-----------|-----------|-----------------|
| D1 | **La Maleta de Vivi** — Maleta escondida en la cocina. Planeaba escapar esa noche | Cocina del club | Vivi tenía motivos para actuar, pero no mató a nadie |
| D2 | **El Abrigo Oscuro** — Vivi lo usó al salir de la cocina. Varias personas lo vieron y lo confunden con una figura sospechosa | Perchero de la cocina | Confunde la identidad del sospechoso |
| D3 | **Las Irregularidades Contables** — Registros que muestran desvíos de fondos por parte de Lola | Oficina contable | Expone el fraude de Lola, pero no tiene relación con el crimen |
| D4 | **El Historial de Gerry** — Rumores de que trabajó para gente peligrosa antes del club | Conversación con otros NPCs | Gerry parece peligroso, pero protegía a su hermana |
| D5 | **Copa con huellas no identificadas** — Copa de bourbon a medio tomar en el reservado de Barry | Reservado privado | Las huellas son de Barry, pero sin contexto parecen de un invitado anónimo |

---

## 4. Diseño de Niveles / Escenarios

> **Nivel único:** Todo el juego transcurre en el club nocturno **"El Agave y La Luna"**. El escenario es uno solo, con varias zonas navegables de forma libre dentro del club.

### 4.1. Mapa General del Club "El Cisne Negro"
```
                    [ ENTRADA / VESTÍBULO ]
                         |        |
                   [fuente]   [guardarropa]
                         |
              [ SALÓN PRINCIPAL ]
            /          |           \
    [escenario]    [pista baile]   [barra]
                         |
              [ PASILLO INTERIOR ]
            /                       \
  [baños / camerino]        [ ALA DE OFICINAS ]
                                    |
                         [ OFICINA DE ERNESTO ]  ← escena del crimen
                                    |
                         [ PASILLO DE SERVICIO ]  ← ruta de Ramona
                                    |
                         [ ALMACÉN / BODEGA ]
```

### 4.2. Zonas del Escenario Único

#### Zona 1: Vestíbulo / Entrada
- **Propósito:** Zona de entrada, presenta el ambiente del club y la noche de la gala.
- **Elementos interactuables:** Fuente ornamental (pistola sumergida, solo visible con inspección detallada — pista opcional bonus).
- **NPCs presentes:** Comisario Aparicio (cerca de la entrada, da el briefing y recibe la acusación final).
- **Ambiente:** Lluvia en los ventanales, música jazz desde el salón, invitados atónitos por la noticia del crimen.

#### Zona 2: Salón Principal / Barra
- **Propósito:** Área social donde se encuentran los sospechosos y el ayudante.
- **Elementos interactuables:** Copas, ceniceros, teléfono de barra (confirmar llamadas de Ramona hablando con el barman).
- **NPCs presentes:**
  - **Don Alberto Fuentes** (en la barra, copa en mano)
  - **Sofía Ramos** (en el escenario o camerino adjunto, llorando)
  - **Félix "El Viejo" Durán** (sentado en una mesa, observando — disponible en todo momento para consultas)

#### Zona 3: Almacén / Bodega
- **Propósito:** Zona trasera del club. Sospechoso en este lugar durante el crimen.
- **Elementos interactuables:** Cajas de botellas, facturas ilegales (pista opcional que expone la operación de Víctor).
- **NPCs presentes:**
  - **Víctor "La Víbora" Salas** (haciendo inventario, nervioso al ver al detective).

#### Zona 4: Pasillo de Servicio
- **Propósito:** Ruta oculta que conecta el almacén con la oficina. Ruta que usó Ramona.
- **Elementos interactuables:** **Pañuelo con iniciales "R.V."** (en el suelo, pista #2).
- **NPCs presentes:** Ninguno. Solo el detective puede acceder (puerta entreabierta).

#### Zona 5: Oficina de Ernesto (Escena del Crimen)
- **Propósito:** Núcleo del misterio. Aquí yace el cadáver y están la mayoría de las pistas.
- **Elementos interactuables:**
  - Cuerpo de Ernesto (inspeccionable)
  - Caja fuerte abierta (contenido revuelto — escenificación del "robo")
  - **El Testamento** sobre el escritorio (pista #1)
  - **El Casquillo** detrás de la estantería caída (pista #3)
  - **El Registro de Llamadas** en mesa auxiliar (pista #5)
  - Cajón cerrado con llave → llave encontrada en el bolsillo de Ernesto → contiene **El Diario** (pista #4)
- **NPCs presentes:** Ninguno (zona acordonada).

#### Zona 6: Área de Interrogatorio (Sala de Reuniones del Club)
- **Propósito:** Sala donde el detective puede sentarse a interrogar formalmente a cada sospechoso.
- **Elementos:** Mesa, sillas, espejo lateral, grabadora de mesa.
- **NPCs presentes:** El sospechoso que el jugador elija llevar a interrogar (el detective interactuará con ellos en el salón o los citará aquí).
- **Interacciones:** Hablar con el sospechoso (STT → LLM → TTS).
- **NPCs presentes:** Ramona Villanueva (sentada junto a la barra, aparenta calma).

---

## 5. Arquitectura Técnica

### 5.1. Diagrama de Arquitectura General
```
┌──────────────────────────────────────────────────┐
│              META QUEST 2                        │
│  ┌────────────┐  ┌───────────┐  ┌────────────┐  │
│  │ Godot 4    │  │ Micrófono │  │ Altavoces  │  │
│  │ (OpenXR +  │  │  (Audio   │  │  (Audio    │  │
│  │  XR Tools) │  │   input)  │  │   output)  │  │
│  └─────┬──────┘  └─────┬─────┘  └─────▲──────┘  │
│        │               │              │          │
└────────┼───────────────┼──────────────┼──────────┘
         │ WiFi          │              │
    ┌────▼────────────────▼──────────────┴────┐
    │         SERVIDOR LOCAL (PC equipo)      │
    │              Python + FastAPI           │
    │  ┌──────────┐ ┌────────┐ ┌───────────┐ │
    │  │  Ollama   │ │Whisper │ │ Piper TTS │ │
    │  │  (LLM)   │ │ (STT)  │ │  (voz)    │ │
    │  └──────────┘ └────────┘ └───────────┘ │
    └─────────────────────────────────────────┘
```

> **Nota:** En la demo final, Ollama puede reemplazarse por OpenAI/Gemini API para mejor calidad.

### 5.2. Stack Tecnológico

| Componente | Tecnología | Notas |
|------------|-----------|-------|
| Motor 3D | Godot 4 + OpenXR + XR Tools | Open-source, soporte nativo OpenXR |
| VR Framework | Meta Quest (OpenXR) | Locomoción, manos, interacciones vía OpenXR |
| Quest 3 Export | Android Export Template (Godot) | APK nativo para Quest 3 |
| LLM (dev) | Ollama (llama3 / mistral / gemma) | Local, gratuito, sin internet |
| LLM (producción) | OpenAI GPT-4o-mini o Gemini Flash | Mejor calidad para demo |
| Speech-to-Text | faster-whisper (local) | Modelo `medium` o `large-v3` |
| Text-to-Speech | Piper TTS (local) | Voces en español, gratuito, offline |
| Backend | Python + FastAPI | Servidor local, proxy entre Godot y IA |
| Comunicación | HTTP/WebSocket (WiFi local) | Quest 3 ↔ PC en misma red |
| Assets 3D | Godot Asset Library / Kenney.nl / itch.io | Estilo visual `[TODO: definir]` |
| Audio/Música | `[TODO]` | Jazz noir, ambiente oscuro |
| Control de versiones | Git + GitHub/GitLab | — |

### 5.3. Pipeline de Interrogatorio (Flujo Técnico)
```
1. Jugador presiona botón en Quest 2 → se activa micrófono
2. Audio capturado → enviado por WiFi al servidor local
3. Servidor: Audio → faster-whisper (STT) → texto del jugador
4. Texto + historial + System Prompt del NPC → Ollama/LLM
5. Respuesta del LLM (texto) → enviada de vuelta al Quest 2 por WiFi
6. Godot muestra el texto del NPC en panel world-space (subtítulos)
7. (Paralelo) El mismo texto del jugador es evaluado por el LLM Asistente
8. Si hay errores gramaticales → Félix interviene con corrección en español
```

### 5.4. Estructura del Proyecto Godot
```
DetectiveNoirVR/
├── scenes/
│   ├── main_menu.tscn
│   └── el_cisne_negro.tscn       # Escenario único: El Cisne Negro
├── scripts/
│   ├── core/
│   │   ├── game_manager.gd      # Estado del juego, pistas, progreso
│   │   └── scene_loader.gd      # Navegación entre escenas
│   ├── npc/
│   │   ├── npc_controller.gd    # Lógica de NPC + comunicación con LLM
│   │   └── dialogue_history.gd  # Historial de conversación
│   ├── clues/
│   │   ├── clue_interactable.gd # Objeto pista interactuable
│   │   └── inventory_system.gd  # Inventario de pistas
│   ├── ai/
│   │   ├── llm_client.gd        # HTTP requests al backend FastAPI
│   │   ├── voice_manager.gd     # Grabación audio, envío STT, recepción TTS
│   │   └── english_assistant.gd # Asistente de aprendizaje de inglés
│   └── vr/
│       ├── vr_locomotion.gd     # Teletransporte + movimiento continuo
│       └── hand_interaction.gd  # Interacciones con manos
├── assets/
│   ├── models/                  # Modelos 3D (.glb/.gltf)
│   ├── materials/               # Materiales y shaders
│   ├── textures/                # Texturas
│   ├── audio/                   # SFX y música
│   └── fonts/                   # Fuentes
├── addons/
│   └── godot-xr-tools/          # Plugin XR Tools para Godot
├── export_presets.cfg           # Configuración export Android (Quest 3)
└── builds/                      # APKs para Quest 3
```

---

## 6. Arte y Estilo Visual

### 6.1. Dirección Artística
`[TODO: Definir estilo. Ej: "Low-poly estilizado con paleta oscura y neones", "Semi-realista con iluminación volumétrica"]`

### 6.2. Paleta de Colores
`[TODO: Ej: Negro #0a0a0a, Gris oscuro #2a2a2a, Ámbar #d4a017, Rojo burdeos #6b0f1a, Azul neón #00b4d8]`

### 6.3. Iluminación
`[TODO: Ej: "Claroscuro, luces de neón, sombras marcadas, lluvia en ventanas, lámparas de escritorio cálidas"]`

### 6.4. Referencias Visuales
`[TODO: Agregar imágenes o links. Ej: L.A. Noire, Blade Runner, Sin City, Disco Elysium]`

---

## 7. Audio

### 7.1. Música
`[TODO: Estilo musical. Ej: "Jazz noir instrumental, piano melancólico, saxofón, contrabajo"]`

### 7.2. Efectos de Sonido
`[TODO: Lista. Ej: pasos, lluvia, puertas chirriantes, sirenas lejanas, máquina de escribir, encendedor]`

### 7.3. Voces (TTS - Piper)
| NPC | Estilo de voz | Modelo Piper |
|-----|--------------|-------------|
| Jefe | Grave, autoritario | `[TODO: seleccionar voz es_MX o es_ES]` |
| Sospechoso 1 | `[TODO]` | `[TODO]` |
| Sospechoso 2 | `[TODO]` | `[TODO]` |
| Sospechoso 3 | `[TODO]` | `[TODO]` |
| Asistente inglés | Amigable, claro, bilingüe | `[TODO]` |

---

## 8. UI/UX en VR

### 8.1. Principios de Diseño VR
- Toda la UI debe ser **diegética** (integrada en el mundo 3D) siempre que sea posible
- Evitar movimientos bruscos de cámara (anti motion-sickness)
- Interacciones naturales con las manos (hand tracking o controllers)
- Snap turn en lugar de giro suave por defecto

### 8.2. Elementos de UI

| Elemento | Tipo | Descripción |
|----------|------|-------------|
| Tablón de pistas | Diegético (en pared) | Pistas recopiladas como fotos/notas |
| Indicador de NPC | Diegético | Ícono sutil sobre NPC cuando puedes hablar |
| Subtítulos | Panel world-space | Lo que dice el NPC y lo que dijiste tú |
| Asistente de inglés | Panel en muñeca o pop-up | Traducciones y vocabulario |
| Menú de pausa | Panel world-space | Opciones, salir, volumen |
| Indicador de grabación | HUD mínimo | Muestra cuando el micrófono está activo |

### 8.3. Mockups
`[TODO: Insertar mockups de las vistas principales]`

---

## 9. Requisitos del Sistema

### 9.1. Requisitos Funcionales

| ID | Requisito | Prioridad |
|----|-----------|-----------|
| RF-01 | El jugador puede moverse por el escenario VR (teletransporte y/o continuo) | 🔴 Alta |
| RF-02 | El jugador puede recoger e inspeccionar pistas con las manos | 🔴 Alta |
| RF-03 | El jugador puede hablar con NPCs usando su voz (micrófono del Quest 3) | 🔴 Alta |
| RF-04 | Los NPCs responden en **inglés** con personalidad única vía LLM, mostrando el texto en un panel world-space | 🔴 Alta |
| RF-05 | El asistente Félix evalúa el inglés del jugador (STT) y corrige errores gramaticales en español | 🔴 Alta |
| RF-06 | El jugador puede acusar a un sospechoso ante el jefe | 🔴 Alta |
| RF-07 | Existe un asistente LLM para ayuda con aprendizaje de inglés | 🟡 Media |
| RF-08 | El jugador posee un inventario de pistas visible en VR | 🟡 Media |
| RF-09 | Se muestran subtítulos de la conversación | 🟡 Media |
| RF-10 | `[TODO]` | `[TODO]` |

### 9.2. Requisitos No Funcionales

| ID | Requisito | Métrica |
|----|-----------|---------|
| RNF-01 | El juego debe mantener mínimo 72 FPS en Quest 3 | ≥ 72 FPS |
| RNF-02 | La latencia STT + LLM + TTS debe ser aceptable | < 5s end-to-end |
| RNF-03 | El juego funciona conectado a un PC local vía WiFi | Red local requerida |
| RNF-04 | El STT debe reconocer **inglés** (con acento latino) con buena precisión | > 85% accuracy |
| RNF-05 | La app no debe producir mareos (motion sickness) | Evaluación subjetiva |
| RNF-06 | `[TODO]` | `[TODO]` |

---

## 10. Pruebas con Usuarios (Entregas 2 y 3)

### 10.1. Escenarios de Prueba
`[TODO: Definir 2-3 escenarios. Ej:]`
1. `[Explorar la escena del crimen y encontrar al menos 3 pistas]`
2. `[Interrogar a los 3 sospechosos y obtener información clave]`
3. `[Acusar al culpable correcto ante el jefe]`

### 10.2. Variables a Medir
| Variable | Instrumento | Momento |
|----------|------------|---------|
| Usabilidad | SUS (System Usability Scale) | Post-test |
| Inmersión / Presencia | IPQ (iGroup Presence Questionnaire) | Post-test |
| Motivación | IMI (Intrinsic Motivation Inventory) | Post-test |
| Emociones | AEQ o SAM | Pre y Post |
| Aceptación de tecnología | TAM (Technology Acceptance Model) | Post-test |
| `[Aprendizaje de inglés]` | `[TODO: Pre/post vocabulary test?]` | Pre y Post |

### 10.3. Cuestionarios
- **Pre-test:** `[TODO: Datos demográficos, experiencia previa con VR, nivel de inglés, expectativas]`
- **Post-test:** `[TODO: SUS + IMI + preguntas abiertas sobre la experiencia]`

### 10.4. Protocolo de Prueba Piloto
`[TODO: Describir condiciones, duración estimada (~15-20 min), número de usuarios (5-8), equipo necesario (Quest 3 + PC)]`

---

## 11. Cronograma Resumido

| Fase | Periodo | Hito Principal |
|------|---------|---------------|
| Fase 1 – Diseño + PoC | 7 abr – 27 abr 2026 | Entrega 1: Informe diseño + prototipo básico |
| Fase 2 – Desarrollo 70% | 28 abr – 1 jun 2026 | Entrega 2: Demo funcional + diseño pruebas |
| Fase 3 – Final + Validación | 2 jun – 29 jun 2026 | Entrega 3: Build APK final + resultados pruebas |

---

## 12. Riesgos y Mitigaciones

| Riesgo | Prob. | Impacto | Mitigación |
|--------|-------|---------|------------|
| Inestabilidad del plugin OpenXR en Quest 3 | Media | Alto | Probar PoC en semana 1 con Godot XR Tools; si falla, ajustar configuración OpenXR |
| Alta latencia LLM+STT+TTS | Media | Alto | Modelos ligeros, streaming, caché de respuestas comunes |
| Motion sickness en usuarios | Media | Alto | Teletransporte por defecto, snap turn, ≥72 FPS |
| Costos de API en demo final | Baja | Medio | Usar Ollama local para dev, API solo para demo |
| WiFi inestable (Quest ↔ PC) | Baja | Medio | Probar en red dedicada, fallback a cable USB |
| Assets 3D de baja calidad | Baja | Medio | Usar packs del Asset Store, estilo low-poly cohesivo |
| `[TODO]` | `[TODO]` | `[TODO]` | `[TODO]` |

---

## 13. Apéndices

### A. System Prompts de NPCs
`[TODO: Documentar los prompts completos de cada NPC aquí. Ejemplo de estructura:]`

```
Eres [NOMBRE], [relación con la víctima]. 
Personalidad: [descripción].
Lo que sabes del crimen: [información].
Lo que NO debes revelar fácilmente: [secretos].
Reglas: Responde siempre en español. Sé coherente con tu personalidad. 
Si el detective te presiona con pruebas válidas, puedes ceder parcialmente.
Nunca admitas el crimen directamente a menos que [condición].
```

### B. Diagrama de Casos de Uso
`[TODO: Insertar diagrama UML]`

### C. Diagramas de Secuencia
`[TODO: Insertar diagramas de secuencia para: interrogatorio, recolección pistas, acusación]`

### D. Diagrama Entidad-Relación
`[TODO: Insertar diagrama ER]`

### E. Diagrama de Estados
`[TODO: Insertar diagrama de estados del flujo del caso]`

---

> 📝 **Nota:** Este es un documento vivo. Los campos `[TODO]` deben completarse progresivamente. Versionar con Git.
