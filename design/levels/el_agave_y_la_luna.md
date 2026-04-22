# Level Design Document — El Agave y La Luna
**Juego:** Limonchero 3D (Detective Noir)
**Versión:** 1.1
**Fecha:** 2026-04-22
**Estado:** En revisión — v1.1 actualiza plataforma VR→PC, reemplaza F3 UV wand por Encendedor de Oro, elimina stain progression.
**Plataforma:** PC (Windows/Linux) · Godot 4 · Controller / Mouse+Teclado

---

## 1. Overview

Todo el juego transcurre en un único escenario: el club nocturno **El Agave y La Luna**, durante su gala anual. Es una noche de años 50 en una ciudad ficticia estadounidense. El dueño, Cornelius "Corn" Maize (mazorca de maíz), ha sido asesinado en su oficina del piso de arriba. El jugador es **Limonchero** (limón, detective de LATAM), asistido por **Gajito** (limón de pica, su traductor). Todos los NPCs hablan exclusivamente en inglés.

El nivel es la historia completa. No hay capítulos ni zonas intermedias — un único espacio continuo con seis áreas navegables.

---

## 2. Player Fantasy

El jugador debe sentir que **el proceso es la justicia**. Barry Peel es culpable desde el primer momento — el juego te da el instinto correcto — pero te niega el derecho a actuar sobre ese instinto hasta que hayas construido el caso. Acusar sin pruebas no es justicia, aunque la verdad sea obvia. Ese es el costo de Limonchero: no la ignorancia, sino la disciplina.

---

## 3. Reglas del Nivel

### 3.1 Flujo crítico (inducido, no forzado)
```
Vestíbulo → Salón principal → Bodega → Pasillo de servicio
                                              ↓
                               Oficina de Cornelius (piso 2)
                                              ↓
                               Sala de interrogatorio
```

**Nota de diseño:** La interrogación de NPCs secundarios (Lola, Moni, Gerry) no es un requisito para el final bueno. Un jugador que recolecta F1+F2+F3 y los marca GOOD puede confrontar a Barry directamente — esto constituye un proceso válido de investigación, no un atajo. El sistema de anti-estancamiento y el coaching de Gajito orientan hacia los NPCs, pero no los imponen.

### 3.2 Ruta de Barry (canon confirmado)
Barry entró al club por la bodega → pasillo de servicio → escalera trasera → oficina de Cornelius. Salió por la **puerta secundaria** de la oficina hacia el corredor de la sala de reuniones (Zona 6), dejando la puerta principal de la oficina cerrada desde dentro.

### 3.3 Reglas sociales del espacio
- Los reservados privados tienen "inmunidad social" — acercarse sin invitación es una transgresión que los NPCs notan.
- El piso de arriba es invitation-only (no físicamente bloqueado, pero culturalmente prohibido). Que Barry tenga la llave maestra es doblemente incriminatorio.
- La parte trasera del club (bodega, pasillo) es una **frontera visual y sonora** — concreto sin pintar, silencio industrial, luz cálida única en vez de ámbar difuso. No es una frontera de idioma (los NPCs del club hablan inglés), sino de clase y territorio. La transición debe sentirse en la textura y el sonido, no en el diálogo.

---

## 4. Detailed Rules — Las Seis Zonas

### Zona 1 — Vestíbulo (~5m × 7m)

**Propósito:** Primera impresión. Presión y orientación.

**Elementos:**
- Puertas dobles sur (vidrio, lluvia visible al exterior)
- Arco norte (4m × 3m) → vista directa al escenario jazz del salón
- Guardarropa oeste: mostrador de madera, ganchos con etiquetas de latón numeradas, espejo detrás
- Coat #14 de Barry en el perchero (llave maestra F2 en el bolsillo)
- Cenicero de vidrio en el mostrador cubriendo el talón del guardarropa

**NPCs:** Commissioner Wallace Spud (papa) — centro, da el briefing tutorial, entrega el Informe Preliminar del NFPD, recibe la acusación final.

**Visual:** Tiles hexagonales crema `#E8DFC8` / negro-cálido `#1E1810`. Paneles de madera oscura `#2A1B0E`. Candelabro asimétrico `#F5DFA0`. Techo de lata prensada `#7A6040`. El neón verde exterior `#8BC34A` entra por las puertas — se deposita como `#5A7A2E` en superficies interiores.

**Interacciones:**
1. Press-X en cenicero → revela talón debajo
2. Press-X en talón → entra al inventario automáticamente
3. Encontrar abrigo #14 en el perchero → press-X en abrigo → prompt "Revisar bolsillos" → llave aparece → F2 adquirido

**Restricción de arte:** El neón no toca el suelo aquí. Solo en superficies verticales.

---

### Zona 2 — Salón Principal / Barra (~18m × 14m, techo 4.5m)

**Propósito:** Hub social. Todos los sospechosos visibles. Desorientación controlada.

**Pista de baile central:** 8m × 8m libre — el jugador puede girar 360° sin chocar con mobiliario.

**Elementos:**
- Escenario jazz (norte, elevado 0.4m, fondo de terciopelo teal-negro) — punto más cálido del nivel
- Barra de caoba oeste (7m), estanterías retroiluminadas en ámbar — rim light para Gerry
- Reservado de Barry (NW, alcoba 0.6m profundidad, papel tapiz geométrico verde oscuro)
  - Copa de bourbon a medio tomar
  - Acuerdo del fideicomiso (F1) boca abajo en la mesa, bajo el vaso
- Reloj art-deco noreste (tiempo narrativo)
- Puerta a bodega: extremo norte de la barra, no visible desde el centro del salón. **Cue de descubrimiento:** cuando el jugador se acerca a menos de 3m del extremo norte de la barra, Gajito dice (1 vez total): *"La cocina ha estado muy callada esta noche. Hay una puerta al fondo del bar."* La luz del foco industrial de la bodega (`#D4903A`) es visible a través del resquicio de la puerta entreabierta desde ese ángulo.
- Corredor este (hacia sala de interrogatorio y baño de empleados): extremo sur de la pared este, aplique de vidrio esmerilado arriba

**NPCs y posiciones:**
| NPC | Posición | Fondo garantizado |
|-----|----------|------------------|
| Barry Peel | Reservado NW, sentado interior | Papel tapiz verde oscuro `#2E4A1E` — 30%+ más oscuro que su amarillo `#F5D020` ✅ |
| Moni Graná Fert | Mesa este (segunda desde el escenario), lámpara de mesa ámbar, cenicero con boquilla y cigarrillo a medio fumar | Cenicero establece su hábito — clave para que el jugador sepa a quién preguntar por el encendedor |
| Lola Persimmon | Mesa centro-sur (más cercana a la pista de baile) | — |
| Gerry Broccolini | Pared oeste junto a la barra | Estanterías retroiluminadas → rim light garantizado ✅ |
| Gajito | Siempre junto al jugador | — |

**Desde el centro de la pista de baile:** 5+ NPCs visibles sin moverse (Gerry desde la barra requiere moverse — excepción aceptada).

**Siluetas estáticas:** Crowd de gala en mesas del fondo — geometría low-poly sin animación para mantener draw calls. **Requisito de pipeline:** todas las siluetas del crowd deben implementarse como `MultiMeshInstance3D` (una sola draw call independientemente del número de instancias). No usar `MeshInstance3D` individual por figura — excedería el budget de <100 draw calls de Quest 2.

**Frase de apertura:** Barry pronuncia su línea al inicio del juego, **siempre antes del briefing de Spud** — debe ser visible y audible antes de que el jugador tenga cualquier frame investigativo. El orden es invariable: Barry habla → Spud hace el briefing.

---

### Zona 3 — Almacén / Bodega (~9m × 7m)

**Propósito:** Recompensa falsa. El jugador se siente listo — y se equivoca.

**Elementos:**
- Estantería piso-techo pared oeste
- Cajas de madera apiladas lado este (colores `#4A3020`–`#6B4423` — más oscuros que Lola para evitar conflicto de color)
- Silla plegable junto a la puerta trasera (puesto vacío de Gerry, 22 minutos)
- **Maleta de Moni (F4)** escondida tras sacos de harina en esquina NE — accesible solo rodeando los sacos (ángulo muerto obligatorio desde la puerta)
- Sub-espacio de cocina: visible a través de media puerta, no del todo accesible
- Puerta de servicio metálica (pared este, entreabierta) → pull visual hacia Zona 4

**Baño de empleados:** Accesible desde el corredor adyacente. Contiene F5 (ceniza de sobre quemado).

**Visual:** Foco industrial único (`#D4903A`) colgante central. Sombras duras y angulares sobre las cajas. Espacio de ángulo muerto NE no visible desde la puerta.

---

### Zona 4 — Pasillo de Servicio (~12m × 2.2m, norte-sur)

**Propósito:** Aislamiento y foco. El único espacio sin NPCs.

**Elementos:**
- Paredes de concreto desnudo sin pintar
- Tres focos de trabajo en el techo — pools de luz cálida con tramos oscuros entre ellos
- Ventana alta con tira de neón verde `#5A7A2E` (única zona donde el neón cae al suelo — intencional)
- Huella de barro de Barry visible entre el 2° y 3° pool de luz (find opcional)
- Segunda huella en el rellano de la escalera (UV wand — find opcional)
- Colilla de palillo de canela junto a la base de la escalera
- Escalera al norte (madera sin alfombrar, pasamanos metálico, gira en el rellano)

**Locomotión:** WASD o joystick izquierdo. La luz de la escalera es visible desde la entrada del pasillo — pull visual para mantener la navegación activa.

**Audio:** Silencio total excepto por goteo de tuberías. Gajito permanece callado aquí a menos que el jugador lo consulte. Su silencio es una señal tonal.

**Restricción de accesibilidad (deuda conocida):** Solo luz verde en este tramo — problema para usuarios con deuteranopia/protanopia. Fix planificado: añadir apliques incandescentes secundarios + tiras reflectoras en el suelo.

---

### Zona 5 — Oficina de Cornelius (~8m × 6m, piso 2)

**Propósito:** Gravedad clínica. La escena del crimen.

**Elementos:**
- Lámpara de escritorio volcada — base visible desde el umbral de la puerta (primera lectura al entrar)
- Escritorio mahogany oscuro (pared norte, cara al sur) — visible desde la puerta
- Caja fuerte abierta (pared este) — la combinación está escrita bajo el cajón del escritorio
- Copia del acuerdo del fideicomiso sobre el escritorio (firmado por Corn, línea de Barry en blanco)
- Contorno de polvo rectangular en el escritorio (donde Barry recogió F1 de arriba)
- Ventana lateral (oeste): abierta, pestillo girado a "cerrado desde dentro" (alguien conocía el mecanismo de moneda)
- **Puerta secundaria** (oeste): comunica con corredor de Zona 6. Cerrojo de latón en la cara interior (Zona 5), actualmente desbloqueado — abre empujando desde Zona 5 hacia el corredor. Sin manija en el lado de Zona 6; solo el ojo de la cerradura es visible desde el corredor.
- **Encendedor de oro (F3)** — en el suelo junto al escritorio, semioculto bajo el borde de la alfombra. Press-X → inventario como "Encendedor de oro (dueño desconocido)". Solo se confirma como de Barry al mostrárselo a Moni.

**Visual:** Lámpara volcada como única fuente de luz a ángulo inusual. Sin neón exterior (zona sellada). Temperatura fría-neutra. La oficina es burocracia hecha espacio físico — archivadores, documentos, framed newspaper en la pared.

**Huellas:** Barry dejó dos juegos de huellas en el rellano (ida y vuelta).

---

### Zona 6 — Sala de Interrogatorio (~5m × 4m)

**Propósito:** Rendición de cuentas formal. El inglés aquí tiene peso.

**Accesos:**
- Corredor este desde el salón (planta baja, sin llave requerida)
- Puerta secundaria desde Zona 5 (piso 2, baja por escalera de servicio)

**Acceso temprano (sin pistas):** Si el jugador entra a Zona 6 antes de tener ninguna pista en la libreta, Gajito dice: *"No tenemos nada todavía. Esta sala no nos dice nada sin un sospechoso."* La silla frente al espejo unidireccional no tiene collider de interacción activo hasta que al menos una pista esté registrada en la libreta.

**Elementos:**
- Mesa rectangular centrada bajo foco de techo (único punto de luz)
- Dos sillas exactamente opuestas
- Espejo unidireccional (pared sur — frente al NPC, no al jugador)
- Bloc de notas con indentaciones del acuerdo del fideicomiso (visible con luz oblicua)
- Puerta secundaria (pared norte) — sin manija desde el corredor; ojo de la cerradura inspeccionable desde Zona 6; solo abre desde el interior de Zona 5 (ver §4 Zona 5)

**Visual:** Paredes `#1E1810`–`#2A2020` (sin rojos cálidos — Moni `#8B2332` debe ser el único rojo saturado en la sala). Mesa simétrica — única geometría con simetría deliberada en todo el nivel. El foco crea sombras hacia arriba en los NPCs (low-poly con sombras invertidas = levemente inquietante).

---

## 5. Formulas y Sistemas

### 5.1 Sistema de Pistas — Libreta VR

**Capacidad:** 8 slots para pistas físicas. Log ilimitado (scrollable) para testimonios.

**Adquirir una pista:** Al presionar X sobre el objeto (o al confirmar un testimonio con el prompt "¿Agregar como evidencia? [X]"), la pista se auto-fotografía en el siguiente slot disponible. El inventario (Tab) se abre automáticamente 3 segundos y luego cierra.

**Estructura de cada slot:**
```
┌────────────────────────────┐
│  [FOTO AUTOMÁTICA]         │
├────────────────────────────┤
│  Nombre / Ubicación        │
├────────────────────────────┤
│  Notas (4 líneas, voz STT) │
├────────────────────────────┤
│  [ BUENA ]    [ MALA ]     │
└────────────────────────────┘
```
Sellos reversibles — el último sello activo es el que cuenta.

**Gate de acusación:**
| Condición | Resultado |
|---|---|
| F1+F2+F3 GOOD + Barry nombrado | Final bueno → confesión |
| F1+F2+F3 GOOD + sospechoso incorrecto | Final malo B2 |
| Evidencia insuficiente + Barry nombrado | Spud acepta → final malo B1 (Barry queda libre, caso cerrado) |
| F4 o F5 GOOD + sospechoso incorrecto nombrado | Spud acepta sin escrutinio → finales malos B3/B4 |

**Orden de evaluación:** F1+F2+F3 GOOD se comprueba primero; si se cumple, el estado de F4/F5 no afecta el resultado. El jugador puede acusar en cualquier momento — no hay gate de bloqueo previo.

### 5.2 Cadena de Interacción — Llave Maestra (F2)

1. Press-X en cenicero → revela talón debajo
2. Press-X en talón → inventario automático. Gajito: *"Un talón del guardarropa. Número 14."*
3. Localizar abrigo #14 en el perchero (gancho de latón numerado)
4. Press-X en abrigo #14. Gajito: *"Ese es. Revisa los bolsillos."*
5. Prompt "Revisar bolsillos [X]" → llave aparece → F2 adquirido
6. Gajito: *"Una llave maestra. La pregunta es para qué la tenía."*

**Puertas que abre:**
- Puerta de la escalera principal del salón (ruta alternativa a Zona 5)
- Puerta principal de la oficina de Cornelius (segunda visita)

**Mecánica de uso:** Acercar F2 al keyhole con E/X → contorno brillante a <0.5m → confirmar → puerta abre. La llave no se consume.

### 5.4 Dificultad de Interrogatorios

| NPC | Resistencia | Condición de crack |
|---|---|---|
| Spud | 0 — siempre habla | Ninguna |
| Lola | 1 — cooperativa en exceso | Ninguna necesaria |
| Gerry | 2 — monosilábico | F2 en inventario → da T3 |
| Moni | 2 — desvía | Ninguna — da T2 libremente (T2 funciona como lead hacia Zona 5, no como confirmación) |
| Barry | 3 — calma absoluta | F1+F2+F3 GOOD simultáneos → confiesa |

El LLM de cada NPC recibe dos variables en el system prompt antes de cada sesión: el **estado de inventario** (qué pistas existen en la libreta) y el **estado de stamps de F1/F2/F3** (GOOD / MALA / sin sello). Para Barry específicamente, la condición de crack verifica que F1+F2+F3 tengan sello GOOD en la libreta al momento de iniciar la sesión de interrogatorio.

**Coaching de Gajito:**
| Trigger | Respuesta | Cooldown |
|---|---|---|
| 90s en interrogatorio sin nuevo testimonio | *"Quizás pregúntale dónde estaba esa noche."* | 90s |
| Pregunta sobre tema prohibido del NPC | *"No hablará de eso. Todavía no."* | Sin cooldown |
| Interrogando a Gerry sin F2 | *"Creo que alguna evidencia que encontramos podría soltarle la lengua."* | 1 vez por sesión |
| Moni da T2 ("traje amarillo") y el jugador no ha visitado Zona 5 | *"Un traje amarillo subiendo. Solo uno de los invitados usa traje amarillo esta noche — y aún no hemos visto ese piso de arriba."* | 1 vez total |
| Interrogando a Barry sin evidencia completa | *"No tenemos todo todavía, jefe. Está muy calmado. Necesitamos más."* | 1 vez por sesión |

### 5.5 Sistema Anti-Estancamiento

Si pasan X minutos sin nueva adquisición, el timer escala. **Una "adquisición" se define como:** recoger un objeto físico, completar un escaneo UV, recibir un testimonio de un NPC (texto registrado en el log), o visitar una zona por primera vez. El timer se reinicia con cualquiera de estos eventos.

| Nivel | Tiempo | Acción de Gajito |
|---|---|---|
| 1 | 4 min | Camina hacia la zona menos explorada — señal física sin palabras |
| 2 | 5 min | Pista verbal por zona: *"La cocina ha estado muy silenciosa esta noche."* / *"Alguien tuvo que subir sin usar las escaleras principales."* |
| 3 | 7 min | Pista directa y accionable: *"Revisa su abrigo. El guardarropa tiene un número."* |

El timer se reinicia con cualquier nueva adquisición. No hay escalada más allá del nivel 3.

**Semántica del timer:** Los niveles son **secuenciales**, no acumulativos. Una adquisición reinicia el timer a 0. El nivel 1 se activa tras 4 minutos continuos sin adquisición; si se produce una adquisición antes de L2, el timer vuelve a 0. El timer se **pausa** durante respuestas LLM activas (estado de espera de red) — el tiempo de latencia del servidor no cuenta como inactividad del jugador.

---

## 6. Edge Cases

| Situación | Comportamiento esperado |
|---|---|
| F3 adquirido antes que F1 y F2 | Válido — el gate de acusación acepta cualquier orden de adquisición |
| Zone 5 visitada vía pasillo antes de conseguir F2 | Válido — la ruta del pasillo no requiere llave; la escalera principal sí |
| Libreta llena (8 slots) | El jugador puede sobrescribir un slot existente seleccionándolo en la UI antes de adquirir la siguiente pista — aparece un prompt de selección. Sin descarte forzado ni crash. Si F3 no está en la libreta y está llena, el jugador debe liberar un slot antes de poder escanear a Barry. |
| Sello GOOD sobrescrito por MALA | Permitido; solo el último sello activo cuenta |
| Talón agarrado sin levantar el cenicero | Imposible — el stub no tiene collider activo mientras el cenicero lo cubre |
| Acusación con notebook vacío | Spud da feedback ("eso es escaso, detective"); no hay crash |
| Silencio durante la acusación (STT timeout) | Sistema espera con prompt de retry; sin hang; sin falso positivo |
| Re-entrar a zonas ya visitadas | Zonas persisten en estado visitado; pistas ya recogidas no son re-adquiribles |
| Usar la llave maestra en ambas puertas | La llave no se consume; ambas puertas quedan abiertas permanentemente |
| F1/F2/F3 descartado de la libreta tras sello GOOD | El gate de acusación lee el **estado actual** de la libreta, no el historial. Descartar una pista marcada GOOD la elimina del gate. La pista no es re-adquirible si ya fue recogida — el jugador debe reiniciar o recuperar el objeto si sigue en el mundo (F1 y F4 son objetos físicos recuperables; F3 y F5 requieren re-escaneo si el slot fue descartado y liberado). |
| F1+F2 GOOD + F3 MALA + Barry nombrado | F3 MALA significa que el jugador rechazó explícitamente esa evidencia. El gate evalúa F1+F2+F3 GOOD → falla → cae a "evidencia insuficiente" → final malo B1. Correcto por diseño: los sellos son reversibles; la responsabilidad del stamp es del jugador. |

---

## 7. Dependencies

| Sistema | Dependencia |
|---|---|
| F3 (encendedor de oro) | Press-X en Zona 5 + mostrar encendedor a Moni en diálogo |
| T2 (testimonio de Moni) | Ninguna (ungated — ver §5.5) |
| T3 (testimonio de Gerry) | F2 en inventario (requiere inyección de flag `has_f2` en el system prompt de Gerry en el servidor LLM; sin este flag, Gerry no ofrece T3 independientemente de la pregunta del jugador) |
| Confesión de Barry | F1+F2+F3 marcados GOOD en la libreta |
| Easter eggs (×5) | Final bueno completado |
| Puerta de escalera principal | F2 (llave maestra) en inventario |
| Stain state progression | Milestones de investigación según §5.2 |
| LLM NPC responses | Servidor Python + FastAPI en localhost (misma máquina que el juego) |

**Nota de área adyacente:** Este es un juego de nivel único. No hay áreas adyacentes fuera de El Agave y La Luna.

---

## 8. Tuning Knobs

| Parámetro | Valor actual | Rango seguro | Efecto |
|---|---|---|---|
| Umbral anti-estancamiento nivel 1 | 4 min | 3–6 min | Más bajo = más intrusivo; más alto = más frustración |
| Umbral anti-estancamiento nivel 2 | 5 min | 4–7 min | — |
| Umbral anti-estancamiento nivel 3 | 7 min | 6–10 min | — |
| Hold UV estado 1 | 3.0s | 2.5–4.0s | Más corto = más fácil; más largo = más satisfactorio |
| Hold UV estado 3 | 0.5s | 0.3–1.0s | Muy corto puede sentirse sin peso |
| Slots de libreta | 8 | 6–10 | Más bajo = más presión; 10+ rompe la tensión |
| Radio de collider bolsillo (F2) | ~15cm | 10–20cm | Más grande = más accesible; más pequeño = más preciso |
| Ángulo del UV cone | 25° | 20–35° | Más amplio = más fácil de apuntar |
| Timeout LLM response | 8s | 5–12s | Más corto = más ágil; más largo = más tolerante a red lenta |

---

## 9. Deuda de Accesibilidad Conocida

Los siguientes problemas son **BLOQUEANTES** para accesibilidad total. Documentados como deuda conocida para la Fase 2.

| ID | Problema | Severidad | Fix planificado |
|---|---|---|---|
| ACC-01 | STT sin fallback no-voz (usuarios sin micrófono o con impedimentos del habla) | BLOQUEANTE | Modo de selección de temas (8-12 opciones por NPC) o teclado VR en Fase 2 |
| ACC-02 | Zona 4 solo iluminación verde — deuteranopia/protanopia no pueden navegar | BLOQUEANTE | Añadir apliques incandescentes + tiras reflectoras (fix de arte, Fase 2) |
| ACC-03 | ~~UV wand~~ — eliminada. Deuda resuelta por remoción del sistema. | ~~BLOQUEANTE~~ | ✅ Resuelto en v1.1 |
| ACC-04 | Zona 6 paredes muy oscuras — bajo contraste para navegación | BLOQUEANTE | Incrementar luz ambiente en la sala de interrogatorio (fix de arte, Fase 2) |
| ACC-05 | ~~UV wand no se ofrece en ruta Zona1→Zona4~~ — eliminada. Deuda resuelta por remoción del sistema. | ~~BLOQUEANTE~~ | ✅ Resuelto en v1.1 |

**Mejoras recomendadas (no bloqueantes):**
- Sistema de subtítulos especificado (32px mínimo, fondo semitransparente, nombre del hablante)
- Segunda página de la libreta con log de testimonios por NPC
- Shader alternativo UV para tritanopia (pulso de luminancia en vez de color)
- Pistas de Gajito on-demand (hold del botón menú)
- Tamaño mínimo de texto en documentos físicos: 0.7° de arco visual a 1m

---

## 10. Acceptance Criteria

El nivel pasa QA cuando todos los siguientes criterios están verificados:

### Ruta crítica
- [ ] **CP-01** — Partida completa de inicio a final bueno sin softlock
- [ ] **CP-02** — Cadena de 4 pasos del guardarropa completa con feedback correcto en cada paso
- [ ] **CP-03** — F3 (encendedor) adquirido con press-X en Zona 5; confirmado por Moni en diálogo
- [ ] **CP-04** — Inventario muestra encendedor como "dueño desconocido" antes de hablar con Moni, y como F3 BUENA después
- [ ] **CP-05** — Gate de acusación acepta exactamente F1+F2+F3 GOOD como mínimo

### Sistemas
- [ ] **CS-01/02** — Sellos BUENA/MALA con haptic y persistencia
- [ ] **CS-03** — Comportamiento de sobreescritura de sellos documentado y consistente
- [ ] **CS-04** — Entrega de libreta a Spud inicia flujo de acusación
- [ ] **CS-05** — F4 y F5 solos no satisfacen el gate

### NPCs
- [ ] **NPC-03** — T2 de Moni se ofrece sin gate de prerequisito; coaching line de Gajito ("traje amarillo...") se activa tras recibirla y el jugador no ha visitado Zona 5
- [ ] **NPC-05** — T3 de Gerry bloqueado hasta tener F2 en inventario
- [ ] **NPC-06** — Pipeline STT→LLM completa en <5s desde fin del habla del jugador. La respuesta (a) está en inglés, (b) referencia al menos una entidad de la última emisión del jugador, (c) no repite textualmente el turno NPC previo. Los tres sub-criterios verificados en test de integración y logueados.

### Accesibilidad (BLOQUEANTE — requerido antes de QA formal)
- [ ] **ACC-01** — Ruta crítica (CP-01) completable usando solo controladores VR con STT desactivado; ningún paso exige entrada de voz
- [ ] **ACC-02** — Zona 4 navegable sin identificar colores: apliques incandescentes y tiras reflectoras presentes y visibles en build de Quest 2
- [x] **ACC-03** — Resuelto: UV wand eliminada. F3 es press-X en objeto físico.
- [ ] **ACC-04** — Zona 6: contraste mínimo 4.5:1 entre paredes y objetos interactivos verificado en capturas de Quest 2
- [x] **ACC-05** — Resuelto: UV wand eliminada. F3 es un objeto físico en Zona 5 sin prerequisito de herramienta.

### Finales
- [ ] Final bueno (Barry confiesa) verificado
- [ ] Al menos 2 de 4 finales malos verificados
- [ ] Nivel permanece explorable post-acusación

### Checklist de playtest (25 ítems, ver §QA)
- [ ] Ningún playtester completamente atascado sin pista de Gajito
- [ ] Sin crashes en sesión de 60 minutos
- [ ] El culpable fue identificado como lógico dado el conjunto de pistas

---

## 11. QA: Plan de Pruebas

El plan completo de QA (34 casos automatizables + 16 manuales + checklist de 25 ítems) está documentado en:
`tests/integration/level/el_agave_y_la_luna_qa.md` *(pendiente de crear — scaffold completo disponible del QA tester)*

**Resumen de cobertura:**

| Categoría | Casos | Gate |
|---|---|---|
| Ruta crítica | 5 | BLOQUEANTE |
| Casos límite | 8 | BLOQUEANTE |
| Interacciones NPC | 6 | BLOQUEANTE |
| Sistema de pistas | 5 | BLOQUEANTE |
| Finales malos | 5 | BLOQUEANTE |
| Anti-estancamiento | 5 | BLOQUEANTE |
| Easter eggs | 6 | ADVISORY |
| Gaps de accesibilidad | 4 | BLOQUEANTE post-fix |
| Checklist playtest | 25 ítems | ADVISORY |

**Preguntas abiertas antes de QA formal:**
1. Confirmar condiciones exactas de finales B1–B4 con el game designer
2. Documentar triggers y contenido de los 5 easter eggs
3. Definir criterio medible para "respuesta LLM noir-apropiada" (propuesta: <8s, sin referencias a mecánicas del juego)
4. Confirmar timeout oficial del pipeline STT→LLM (sin TTS — balbuceo local). Propuesta: <5s end-to-end.

---

## 12. Easter Eggs (post-final bueno)

| ID | Ubicación | Interacción | Recompensa |
|---|---|---|---|
| E1 | Vaso de Barry (Zona 2, reservado) | Sostener el vaso 3 segundos | Gajito: *"Nunca terminó su trago. Supongo que tenía problemas más grandes."* + nota de piano. |
| E2 | Abrigo #14 (Zona 1, perchero) | Recoger el abrigo de nuevo | Fotografía en el bolsillo vacío: Barry y Cornelius jóvenes frente al club en construcción |
| E3 | Maleta de Moni (Zona 3, bodega) | Reabrir la maleta | Gajito: *"Lo busqué. Es una receta. Licor de granada de un pueblo que ya no existe."* |
| E4 | Ledger de Lola (Zona 5, escritorio) | Abrir el ledger | Línea circulada en rojo: retiro de B.P. aprobado por Corn dos semanas antes del asesinato — luego revertido. **Nota narrativa:** el retiro revertido no constituye un móvil económico — es la última humillación en una serie de indignidades, no una causa material. Ver Cast Bible (Barry, nota de motive E4) para la distinción canónica. |
| E5 | Crucigrama de Gerry (Zona 3, puesto de guardia) | Recoger el periódico | Crucigrama completamente resuelto, todas las respuestas correctas. Gajito: *"Es más inteligente de lo que parece."* |

---

*Documento generado por el equipo de diseño de nivel: narrative-director, world-builder, art-director, level-designer, systems-designer, accessibility-specialist, qa-tester.*
*Próximos pasos: `/design-review design/levels/el_agave_y_la_luna.md` → `/dev-story` para implementación → `/qa-plan` para plan de pruebas formal.*
