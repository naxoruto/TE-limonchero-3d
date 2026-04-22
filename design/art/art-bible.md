# Art Bible — Limonchero 3D (Detective Noir VR)
**Versión:** 1.0
**Fecha:** 2026-04-16
**Equipo:** Ignacio Cuevas, Martin Cevallos, Sofia Meza, Diego Espinosa
**Motor:** Godot 4 · Plataforma objetivo: Meta Quest 2

---

## Estado de Secciones

| Sección | Estado |
|---|---|
| 1. Visual Identity Statement | **Completa** |
| 2. Mood & Atmosphere | **Completa** |
| 3. Shape Language | **Completa** |
| 4. Color System | **Completa** |
| 5. Character Design Direction | **Completa** |
| 6. Environment Design Language | **Completa** |
| 7. UI/HUD Visual Direction | **Completa** |
| 8. Asset Standards | **Completa** |
| 9. Reference Direction | Pendiente |

---

## 1. Visual Identity Statement

### 1.1 Regla Fundacional

**"Todo elemento visual es una fruta atrapada en una noche que no terminará: orgánica por naturaleza, rígida por el noir, elegante por los años 50."**

Esta regla resuelve cualquier decisión ambigua: cuando un elemento puede ser suave o duro, cálido o frío, vivo o muerto — elige la tensión entre ambos, no uno solo. Una copa de bourbon tiene curvas de vidrio (orgánico) y refleja un neón verde frío (noir). Una silla tiene líneas art-deco angulares (años 50) con una tela desgastada que tiene textura de cáscara (frutícola). La tensión es la identidad.

---

### 1.2 Tres Principios de Apoyo

#### Principio A — "La Silueta Manda Sobre el Detalle"
**Pilar:** Detective / Legibilidad noir

En noir, la figura se lee contra el fondo oscuro antes de que el ojo procese cualquier textura. En un mundo low-poly de frutas humanoides, la silueta es la única información que el jugador tiene a 4 metros.

**Prueba de diseño:** Cuando un artista duda entre añadir un detalle geométrico (más polígonos en la cara, una solapa en el saco) o reforzar el contorno del personaje, este principio dice: refuerza el contorno. El detalle que no se lee desde 4 metros no existe para el jugador.

**Aplicación en Blender:** Renderiza el modelo como silhouette shader (negro plano sobre blanco) a escala de juego. Si no identificas el arquetipo del personaje en 2 segundos, la silueta no es suficientemente fuerte. Añade masa donde falta, no detalle.

---

#### Principio B — "El Color Frutícola es Siempre el Foco"
**Pilar:** Frutas / Años 50

El mundo ambiente de El Agave y La Luna se mantiene en una paleta de marrones cálidos, grises y oros desaturados. Los personajes frutícolas son los únicos portadores de color saturado en el espacio. Esto no es coincidencia — es jerarquía visual.

**Prueba de diseño:** Cuando un elemento de entorno compite con un personaje por saturación (un tapiz demasiado verde, una lámpara demasiado ámbar), este principio dice: desatura el entorno, no el personaje. La excepción son los neones de ambiente, que tienen saturación alta pero baja luminosidad, por lo que no compiten con la superficie de los personajes.

**Aplicación en Blender:** Convierte la escena a escala de grises. El personaje debe ser el elemento más brillante o con más contraste en su zona. Si no lo es, el entorno está demasiado saturado.

---

#### Principio C — "Geometría Honesta: Sin Curvas Que el Modelo No Pueda Sostener"
**Pilar:** Low-poly / Años 50 Art Deco

El estilo low-poly facetado es una declaración estética, no un límite técnico. Las formas deben abrazar el facetado como un lenguaje — las frutas son cuerpos geométricos aproximados, no esferas suavizadas. El Art Deco de los años 50 ya trabaja con formas geométricas fuertes: esto crea coherencia natural.

**Prueba de diseño:** Cuando un modelo tiene curvas suaves y el flat shading las aplana visualmente haciéndolo parecer facetado de mala calidad, este principio dice: rediseña con menos polígonos y formas más honestas. Un limón es un elipsoide de 16-20 caras, no una esfera subdividida. El resultado debe verse intencionado.

**Aplicación en Blender:** Usa flat shading desde el inicio. No apliques smooth shading y luego reduzcas polígonos. El modelo debe diseñarse con flat shading activo para que cada decisión geométrica sea visible durante el modelado.

---

## 2. Mood & Atmosphere

### 2.1 Exploración Libre del Club

**Emoción objetivo:** Desconfianza placentera — el jugador sabe que algo está roto en este espacio, pero aún no sabe dónde.

**Carácter de iluminación:**
- Temperatura: 2700K–3200K (ámbar dorado cálido, propio de lámparas incandescentes de época)
- Contraste: Medio-bajo. Las sombras existen pero no son amenazantes — el espacio está "vivo" con la gala
- Dirección: Lateral desde las lámparas de mesa y apliques de pared. Sin luz cenital dura. El techo siempre está en sombra

**Descriptores atmosféricos:**
- Humo de palillo de canela que difumina los bordes de la luz
- Jazz de piano que llena los silencios sin explicarlos
- Ámbar que se deposita en superficies horizontales como barniz
- Neón verde exterior que se filtra por los ventanales como una verdad que no ha entrado todavía
- Silencio del piso de arriba — ausencia que pesa

**Nivel de energía:** Medio. El espacio tiene calor social y movimiento de fondo (crowd de siluetas), pero la cámara en primera persona lo aísla del jugador. La gala es un telón, no una multitud.

---

### 2.2 Interrogatorio Activo

**Emoción objetivo:** Presión asimétrica — el jugador tiene el poder formal de la interrogación pero siente que el NPC sabe más y está esperando que cometa un error.

**Carácter de iluminación:**
- Temperatura: 3500K–4000K (blanco cálido, más clínico que el salón). La sala de interrogatorio abandona el ámbar del club
- Contraste: Alto. El único foco de luz es el colgante de techo, directamente sobre la mesa. Las paredes (`#1E1810`–`#2A2020`) absorben toda luz lateral
- Dirección: Cenital directa sobre la mesa. El foco crea sombras hacia arriba en los NPCs — inversión sutil de la iluminación "normal" que genera incomodidad

**Descriptores atmosféricos:**
- Silencio activo — ningún audio ambient, solo el balbuceo del NPC y el eco corto de la sala
- El espejo unidireccional devuelve la luz como testigo mudo
- Las sombras de los pómulos del NPC suben en vez de bajar (efecto del foco cenital sobre geometría low-poly)
- La mesa simétrica crea una frontera visual clara entre interrogador y sospechoso
- El bloc de notas con indentaciones — texto visible solo con luz oblicua, una verdad que requiere el ángulo correcto

**Nivel de energía:** Bajo-tenso. No hay movimiento de fondo. El tiempo se siente más largo de lo que es.

---

### 2.3 Descubrimiento de Pista

**Emoción objetivo:** Claridad súbita seguida de una nueva pregunta — no alivio, sino aceleración.

**Carácter de iluminación:**
- Temperatura: La pista hereda la temperatura de su zona, pero recibe un rim light blanco frío (`#E8F0F8`, 6500K) que la separa del entorno sin romper el espacio
- Contraste: Puntual. Solo el objeto adquiere contraste alto en el momento del descubrimiento
- Dirección: Desde arriba y atrás del objeto

**Descriptores atmosféricos:**
- El balbuceo de Gajito se activa — su voz energética en un espacio silencioso es un marcador tonal
- La UI de la libreta aparece en world-space con un sonido de papel que ancla la pista al mundo físico
- El entorno baja temporalmente su luminosidad en 15% (vignette suave) para centrar el foco
- La pista flota en la mano del jugador 1.5 segundos antes de ir al inventario
- Silencio del jazz durante 2 segundos: el mundo acknowledges el descubrimiento

**Nivel de energía:** Pico corto y dirigido. No euforia — precisión.

---

### 2.4 Acusación Final

**Emoción objetivo:** Soledad de la certeza — el jugador sabe que tiene razón y ese conocimiento es una carga, no un triunfo.

**Carácter de iluminación:**
- Temperatura: 2200K–2500K (ámbar muy cálido, casi cobrizo). El ciclo cierra con la misma luz del inicio, pero ahora se siente más pesada
- Contraste: Máximo del juego. Spud iluminado desde abajo, Barry en sombra casi total hasta que confiesa
- Dirección: La única luz dura del juego. Sin difusión. Las sombras tienen bordes

**Descriptores atmosféricos:**
- El jazz del salón se corta al iniciar la secuencia — silencio total excepto la lluvia exterior
- Las manchas oscuras en las manos de Barry son ahora visibles desde la distancia normal de conversación
- La frase de Barry — *"I signed mine tonight. Just not on paper."* — se muestra en texto sin balbuceo
- El neón verde exterior ya no filtra por las puertas — las puertas están cerradas
- Gajito no habla durante la acusación. Su silencio es el cierre de su arco

**Nivel de energía:** Bajo y absoluto. El juego deja de moverse.

---

### 2.5 Menú de Pausa

**Emoción objetivo:** Distancia controlada — el jugador está fuera del mundo, pero el mundo no ha desaparecido.

**Carácter de iluminación:**
- La escena de fondo continúa renderizándose con desenfoque de profundidad aumentado y reducción de saturación al 60%
- Temperatura: Fría-neutra (`#C8D0D8`), en contraste con el ámbar del juego activo

**Descriptores atmosféricos:**
- Fondo del juego visible pero lejano — el mundo persiste como recuerdo
- Tipografía monospace de época sobre panel de cuero oscuro `#1A1208`
- Jazz bajado a 15% de volumen, filtrado como si viniera de otra habitación

**Nivel de energía:** Nulo. El menú es un umbral.

---

### 2.6 Créditos Finales

**Emoción objetivo:** Melancolía de cierre — el caso está resuelto pero El Agave y La Luna continúa sin el jugador.

**Carácter de iluminación:**
- Temperatura: 2700K — la noche regresa a su estado original
- Contraste: Muy bajo. El espacio del club se ve desde fuera, a través de los ventanales lluviosos
- Dirección: Ambiental difusa, como si el jugador mirara el club desde la calle

**Descriptores atmosféricos:**
- El club visto desde el exterior — neón verde activo, lluvia, jazz amortiguado por el vidrio
- La lluvia cae por el vidrio distorsionando las luces del neón: `#8BC34A` se convierte en líneas fluidas
- Cada crédito de personaje va acompañado de su balbuceo característico, breve, a bajo volumen
- La última línea de texto se desvanece antes de que el jazz termine — el mundo no espera

**Nivel de energía:** Muy bajo y continuo. El cierre no es un corte, es un fundido largo.

---

## 3. Shape Language

### 3.1 Filosofía de Silueta de Personaje

**Principio rector:** Cada arquetipo de personaje tiene una geometría primaria que domina su silueta y deriva directamente de su fruta de origen. La legibilidad a 4 metros no depende de color ni textura — depende de masa y contorno.

**Geometría primaria por personaje:**

| Personaje | Fruta | Geometría primaria | Firma de silueta |
|---|---|---|---|
| Limonchero | Limón amarillo | Elipsoide alargado vertical | Alto, delgado, eje vertical fuerte. El fedora extiende el eje sin romperlo |
| Gajito | Key lime | Esfera achatada | Bajo, redondeado, compacto. La silueta "cabe dentro" de la de Limonchero |
| Commissioner Spud | Papa | Elipsoide irregular con base plana | Bajo, ancho, estable. Comunica "inamovible" |
| Barry Peel | Plátano | Arco cóncavo elongado | La curvatura define la postura — se inclina ligeramente, nunca completamente recto |
| Moni Graná Fert | Granada | Esfera con corona geométrica | Redonda pero con puntos angulares en la corona — tensión entre suavidad y filo |
| Gerry Broccolini | Brócoli | Masa triangular con cabeza ramificada | Ancho en hombros, cabeza que se expande hacia arriba — triángulo invertido |
| Lola Persimmon | Caqui | Tomate achatado con pico | Redonda con un pico inferior que crea inestabilidad visual |

**Regla de legibilidad a 4 metros:** Renderiza todos los personajes juntos en silhouette shader a escala de juego. Cada silueta debe ser identificable sin contexto de color. Si dos personajes son ambiguos, uno necesita intervención de masa.

---

### 3.2 Geometría de Entorno

**Dominio angular.** El entorno de El Agave y La Luna es predominantemente angular — Art Deco con geometría rígida, repetición de patrones geométricos y planos facetados que hacen eco del flat shading de los personajes.

**Por qué angular:** Las frutas ya traen la curvatura orgánica al espacio. Si el entorno también es curvo, los personajes se disuelven en él. El entorno angular crea un contraste de forma que hace a los personajes visualmente predominantes en cualquier zona.

**Reglas geométricas por elemento:**
- **Suelos:** Patrones de baldosas con ángulos de 45°, 60° o 90°. Nunca formas orgánicas.
- **Paredes:** Planos limpios con molduras Art Deco lineales — líneas rectas con relieves escalonados, sin arcos excepto en la entrada principal.
- **Mobiliario:** Ángulos rectos dominantes. Las curvas de época se aproximan con 3–5 segmentos, nunca más.
- **Arcos:** Solo en el arco de entrada norte del vestíbulo (Zona 1). El resto: aberturas rectangulares.
- **Techos:** Casetones planos o lata prensada con patrón geométrico repetido. Sin vigas curvas.

**Excepción orgánica controlada:** La barra de caoba (Zona 2) tiene un frente con curva suave en planta — la única curva en el entorno del club. Existe intencionalmente para que la barra sea el segundo elemento más orgánico de la sala después de los propios personajes.

---

### 3.3 Gramática de UI

**La UI diegética replica el mundo, pero en su propio idioma geométrico.**

- Papel con bordes cortados rectos (sin bordes redondeados en la libreta)
- Tipografía de máquina de escribir — caracteres con anchura uniforme, sin kerning óptico
- Sellos de caucho para marcadores BUENA/MALA: círculo con borde grueso + texto en caps. La forma circular contrasta con la geometría angular del entorno, haciéndolo visualmente prominente sin usar color adicional
- Las fotografías de pistas tienen borde blanco fino — el marco fotográfico de época es la UI que separa la pista del mundo

**Indicadores de interacción en world-space:** Un anillo de contorno hexagonal (no circular) que aparece alrededor del objeto interactivo. La forma hexagonal conecta con los tiles hexagonales del vestíbulo — el mismo vocabulario geométrico del suelo aparece como indicador de interacción.

---

### 3.4 Formas Héroe vs. Formas de Soporte

**Formas héroe** (atraen el ojo, geometría compleja):
- Los personajes frutícolas — máxima complejidad geométrica, portadores de silueta única
- Las pistas físicas — el encendedor de oro tiene una faceta que refleja la luz en el ángulo correcto
- El arco de entrada norte — única curva arquitectónica del espacio
- La barra de caoba — única curva en planta del mobiliario

**Formas de soporte** (retroceden, geometría simplificada):
- Sillas y mesas del crowd — geometría de 4–6 polígonos por objeto
- Cajas del almacén — bloques rectangulares con variación de altura, sin detalle de superficie
- Siluetas del crowd de gala — `MultiMeshInstance3D`, geometría mínima

**Regla de jerarquía geométrica:** Ningún objeto de soporte puede tener más polígonos que el personaje más cercano a él. El entorno sirve al personaje.

---

### 3.5 Conexión entre Geometría Low-Poly y Naturaleza Frutícola

El flat shading revela la estructura interna del modelo: cada faceta es una afirmación sobre la forma del cuerpo. En frutas humanoides, el cuerpo del personaje muestra explícitamente los planos de su fruta de origen.

- **Limonchero:** Las facetas del torso siguen la curvatura del limón — más anchas en el ecuador, más estrechas en los polos. El saco de detective está diseñado para no ocultar estos planos.
- **Moni Graná Fert:** Los ángulos de la corona (sépalos de la granada) son los únicos ángulos agudos en toda su silueta — el único filo en un cuerpo que de otra forma es todo curva.
- **Gerry Broccolini:** La cabeza ramificada se resuelve como una masa de triángulos irregulares — el único personaje con geometría verdaderamente irregular. Comunica textura y rudeza sin más polígonos.

**Conexión con el Visual Identity Statement:** Este es el cumplimiento directo del Principio C ("Geometría Honesta"). La geometría low-poly no disimula la fruta — la celebra.

---

## 4. Color System

### 4.1 Paleta Primaria

Estos colores están anclados en los hex codes establecidos en las secciones 5–8 del art bible. No son nuevos colores — son la formalización y asignación de roles a los colores que ya existen en el diseño.

| # | Nombre | Hex | Rol |
|---|---|---|---|
| C1 | **Bourbon** | `#D4A030` | Color de poder y engaño. El oro de El Agave — lámparas, marcos, herrería art deco. No es el oro limpio de la riqueza sino el oro envejecido de algo que alguna vez fue respetable. |
| C2 | **Caoba** | `#2A1B0E` | El suelo del club, las paredes de madera, la estructura del mundo. Color de permanencia y jerarquía. |
| C3 | **Crema Tile** | `#E8DFC8` | Superficies neutras, baldosas del vestíbulo, papel de la libreta. El color de los hechos sin interpretar. |
| C4 | **Verde Neón** | `#8BC34A` | El exterior del mundo. El neón de El Agave y La Luna. Cuando aparece dentro del club, es una intrusión. |
| C5 | **Rojo Granada** | `#8B2332` | Color de Moni y de lo que oculta. Único rojo saturado del juego. Cuando aparece en otro contexto, es una alarma. |
| C6 | **Amarillo Barry** | `#F5D020` | Color del culpable. El más saturado y luminoso del juego — visible desde el inicio. El juego no oculta al culpable: oculta las pruebas. |
| C7 | **Tinta Noir** | `#1E1810` | El negro cálido del juego. No es negro puro — tiene temperatura ámbar. El negro puro (`#000000`) no existe en El Agave y La Luna. |

---

### 4.2 Uso Semántico del Color

**¿Qué comunica el rojo?** (`#8B2332`) — Moni Graná Fert. Secreto activo. Algo que ya pasó y no puede deshacerse. Solo un elemento rojo saturado por zona: si hay más de uno en el campo visual, algo está mal con esa lectura.

**¿Qué comunica el dorado?** (`#D4A030`) — Autoridad institucional y su corrupción. Las lámparas de Spud son doradas. El encendedor de Barry es dorado — un objeto de autoridad personal en manos del culpable. El dorado no es bueno ni malo: es el color de las instituciones que el noir examina.

**¿Qué comunica el blanco?** — No existe blanco puro en el juego. Existe solo en la UI (`#F5F0E8` — blanco cálido) y como rim light de descubrimiento de pistas (`#E8F0F8`). La ausencia de blanco puro en el mundo es una declaración: en El Agave y La Luna, nada es completamente inocente.

**¿Qué comunica el negro?** (`#1E1810`) — El negro cálido es el estado natural del espacio. Las sombras del club no son amenazantes — son normales. Esto invierte la lectura convencional del noir: aquí, la oscuridad no indica peligro. Lo peligroso está en la luz.

**¿Qué comunica el verde?** (`#8BC34A`) — El exterior. Lo que está fuera del club. El verde en el suelo del pasillo es la única pista visual de que Barry pasó por ahí — el color del exterior en el corazón del club.

**¿Qué comunica el amarillo?** (`#F5D020`) — Visibilidad forzada. Barry es el único personaje que no puede ocultarse en el entorno oscuro del club. El juego te lo muestra desde el primer minuto. El jugador lo ignora porque no tiene pruebas todavía.

---

### 4.3 Reglas de Temperatura por Área

| Zona | Temperatura | Descripción |
|---|---|---|
| **Zona A** — Vestíbulo y salón principal | 2700K–3200K (ámbar cálido) | Marrones cálidos `#2A1B0E`–`#4A3020` + oro `#D4A030`. La calidez es falsa amabilidad. |
| **Zona B** — Almacén y pasillo de servicio | 3500K–4000K (blanco industrial) | Grises verdes `#4A5040`–`#6A7060`. El servicio no tiene pretensiones de elegancia. |
| **Zona C** — Barra y reservados | 2700K (caoba y cuero cálido) | Caoba `#2A1B0E` + cuero `#5A3020`. La zona más cálida — comfort como trampa. |
| **Zona D** — Sala de interrogatorio y oficina | 4000K–5000K (neutra-fría) | Cemento `#3A3830`. Sin ámbar. Sin engaño decorativo. La verdad tiene temperatura neutra. |

**Regla de transición:** El cambio de temperatura entre zonas no es corte — es gradiente. Al moverse del salón al almacén, la temperatura sube ~300K por cada 2 metros. Implementar con `WorldEnvironment` zone volumes o interpolación en el Environment resource según la posición Z del jugador.

---

### 4.4 Paleta de UI

La UI diverge del mundo en un aspecto específico: usa blanco frío donde el mundo usa ámbar. Esta divergencia es intencional: la UI representa la mente del detective, no el club.

| Elemento UI | Color | Hex | Por qué diverge |
|---|---|---|---|
| Fondo de libreta | Crema cálido | `#F5F0E8` | Papel de época, coherente con el mundo |
| Texto de libreta | Tinta sepia | `#2A1A08` | Máquina de escribir, sin negro puro |
| Sello BUENA | Verde botella | `#2A5A20` | Desaturado vs. el verde neón externo — no confunde con `#8BC34A` |
| Sello MALA | Rojo sello | `#6A1520` | Más oscuro que `#8B2332` (Moni) — no confunde al culpable con un sello |
| Rim light de pista | Blanco frío | `#E8F0F8` | Único blanco frío del juego — señal inequívoca de objeto interactivo |
| Indicador PTT activo | Ámbar pulsante | `#D4A030` | Reutiliza Bourbon — el micrófono es una herramienta de autoridad |
| Pop-up de Gajito | Verde lima | `#7ABE30` | Cercano al key lime de Gajito sin ser idéntico al verde neón exterior |
| Menú de pausa | Cuero oscuro + blanco frío | `#1A1208` / `#D8DCE0` | El menú usa temperatura opuesta al mundo para señalar que estás "fuera" |

---

### 4.5 Seguridad para Daltonismo

Ningún sistema de información crítica del juego puede depender exclusivamente del color. Cada sistema tiene un segundo canal que funciona con cualquier tipo de visión.

| Color semántico | Riesgo | Respaldo no-color |
|---|---|---|
| Sello BUENA (verde) vs. Sello MALA (rojo) | Deuteranopia/protanopia confunden verde y rojo | **Forma:** BUENA = círculo completo; MALA = círculo con X interior |
| Verde Neón `#8BC34A` como señal de ruta | Deuteranopia puede hacerlo invisible | **Contraste de luminancia:** L≈70 sobre paredes L≈23 — ratio 4.8:1 suficiente |
| Amarillo Barry `#F5D020` | Tritanopia puede confundir amarillo con verde | **Silueta:** La curvatura del plátano identifica a Barry independientemente del color |
| Rojo Granada `#8B2332` de Moni | Deuteranopia puede perder el rojo contra fondos oscuros | **Forma:** Moni es el único personaje con corona geométrica angular — la corona la identifica |
| Rim light de pista `#E8F0F8` | Tritanopia puede confundir con blanco ámbar del entorno | **Animación:** El rim light de descubrimiento pulsa a 0.5Hz — ningún otro elemento lo hace |

---

## 5. Character Design Direction

### 5.0 Principio Rector

En Limonchero 3D, cada personaje es una fruta con un crimen que esconder o un secreto que proteger. El diseño visual debe hacer dos cosas simultáneamente: comunicar el **arquetipo de rol** (quién es esta persona en la jerarquía del caso) y la **naturaleza frutal** (qué implica ser un plátano, una granada, un betabel). Cuando ambas lecturas coinciden en una silueta, el artista ha hecho su trabajo.

La estética low-poly no es una limitación de presupuesto — es el idioma visual del juego. Las caras angulares no suavizan, exageran. Un personaje preocupado no frunce el ceño gradualmente: sus planos faciales se reorganizan en ángulos más agresivos. Trabaja con la geometría, no contra ella.

---

### 5.1 Filosofía de Silueta por Arquetipo

Un jugador de VR debe identificar el rol narrativo de un personaje **a 3 metros de distancia, en escena oscura, sin leer etiquetas**. La silueta es el único canal que funciona en esas condiciones. Cada arquetipo tiene una firma de silueta no negociable.

#### 5.1.1 Tabla de Siluetas por Rol

| Arquetipo | Perfil de Silueta | Característica Dominante | Qué NUNCA hacer |
|---|---|---|---|
| Protagonista (Limonchero) | Vertical, capas superpuestas (fedora + gabardina) | La gabardina ensancha los hombros; la fedora alarga la vertical | Silueta compacta o sin sombrero |
| Asistente (Gajito) | Vertical delgado, sin capas pesadas | Más pequeño que el protagonista, energía hacia arriba | Hacerlo igual de alto o más ancho |
| Autoridad (Spud) | Horizontal, bloque macizo | Hombros anchos, cuello corto, poca vertical | Silueta esbelta o elegante |
| Culpable (Barry) | Limpio, contenido, sin elementos que rompan el contorno | Traje que no cuelga ni se mueve — sin asperezas | Silueta caótica, ropa arrugada |
| Sospechosos inocentes | Variable por personaje, pero con un **elemento disruptivo** visible | Un fedora torcido, un vestido de vuelo, una postura encorvada | Siluetas genéricas intercambiables entre sí |

#### 5.1.2 Jerarquía de Altura

La altura comunica poder e importancia narrativa de forma inmediata en VR. Mantén esta escala relativa en todas las escenas. Limonchero = 100% (referencia base).

```
Gerry Broccolini     ████████████  125%  (el más alto — presencia física intimidante)
Commissioner Spud    ███████████   115%  (macizo, casi igual de alto que Gerry)
Barry Peel           ██████████    105%  (porte impecable, muy cerca de la referencia)
Limonchero           █████████     100%  (referencia base)
Lola Persimmon       ████████       90%  (adulta, compacta, sin carácter intimidante)
Moni Graná Fert      ███████        85%  (estatura escénica + corona dentada sumando vertical)
Gajito            ██████         75%  (el más bajo — subraya su inmadurez)
```

Regla: ningún NPC secundario puede coincidir en altura con Barry Peel dentro de ±5% de la altura total del modelo. Barry debe mantenerse visualmente separado del resto a nivel de escala.

---

### 5.2 Reglas de Proporción por Tipo de Personaje

Limonchero establece el canon de proporciones. Todas las variaciones se definen como delta respecto a él.

#### 5.2.1 Limonchero — Proporciones de Referencia

Del concept sheet aprobado:
- Cabeza: ~25% de la altura total (1/4 — ligeramente sobredimensionada respecto al realismo)
- Torso: neutro, cubierto por gabardina — los hombros de la gabardina definen el volumen, no el torso subyacente
- Piernas: moderadamente largas, angulares — pantalones facetados con planos claramente visibles
- Manos/pies: estilizados, no anatómicos — los dedos son masas geométricas simples
- Proporción cabeza/cuerpo: 1:4 (más cartoon que heroico, más peso que chibi)

Esta proporción es el **nivel 0**. Las variaciones son delta sobre este baseline.

#### 5.2.2 Modificadores de Proporción por Arquetipo

**Asistente (Gajito) — cabeza grande, cuerpo comprimido**
- Cabeza: ~29% de la altura total (1/3.5 — más grande proporcionalmente que Limonchero)
- Torso: ligeramente comprimido — menos espacio entre cabeza y cintura
- Efecto narrativo: la cabeza grande comunica pensamiento, inmadurez física, energía mental sobre corporal
- La cabeza de key lime es más pequeña y redondeada que la del limón — mantener esa diferencia de volumen

**Autoridad (Commissioner Spud) — expansión horizontal, compresión vertical**
- Cabeza: ~22% de la altura total (1/4.5 — proporcionalmente más pequeña, aplastada por el peso del cuerpo)
- Torso: +30% de anchura respecto a Limonchero
- Cuello: prácticamente inexistente — la cabeza descansa sobre los hombros
- Piernas: cortas en relación al torso — la mayor parte de la masa está arriba
- Efecto narrativo: el cuerpo de betabel es naturalmente redondeado y comprimido; comunica que este hombre ocupa espacio pero no crece

**Culpable (Barry Peel) — proporciones más cercanas al realismo**
- Cabeza: ~22% de la altura total (1/4.5 — menor que Limonchero, menos cartoon, más amenaza latente)
- Torso: elegante, sin exceso de volumen
- La reducción de la ratio cartoon es deliberada: Barry no quiere llamar la atención. Un personaje más cercano al realismo en un mundo cartoon genera extrañeza sutil
- No se compensa la reducción cartoon con ningún detalle llamativo — la contención es su señal

**Sospechosos inocentes — individualizado por fruta**
- Moni Graná Fert: cabeza ~28% (1/3.6) incluyendo la corona dentada, cuerpo en A (más ancho abajo por el vestido granate) — la granada es globosa y coronada, el diseño amplifica eso
- Gerry Broccolini: cabeza ~20% (1/5, pequeña en relación al cuerpo enorme) — la copa arbórea del brócoli tiene masa en la parte superior; invertirlo da sensación de solidez abajo y elemento cómico-amenazante arriba
- Lola Persimmon: cabeza ~25% (1/4), cuerpo ligeramente redondeado — el caqui es oval, la proporción es media sin extremos

---

### 5.3 Mapeo Frutal — Cómo la Fruta Define el Diseño

La fruta no es solo el color de piel. Es la geometría base del cuerpo, la textura implícita, y la arquitectura del personaje. Cada artista debe preguntarse: **¿qué tiene esta fruta que ninguna otra tiene?** Esa cualidad singular debe ser visible en el diseño final.

#### 5.3.1 Limonchero — Limón amarillo

- **Forma base del cuerpo**: ovalada con extremos ligeramente puntiagudos — el torso no es un cilindro, tiene punta en la parte superior del cráneo y en la barbilla
- **Piel**: amarillo-verdoso mate con ligeras facetas que imitan la cáscara rugosa del limón. No lisa, no brillante — la textura del limón es granular; el low-poly la convierte en facetas pequeñas
- **Color**: `#B5C44A` para la piel base (amarillo-verdoso apagado, como limón no maduro del todo). Ver concept sheet para referencia visual aprobada
- **Detalle específico**: el limón tiene un pequeño botón en el extremo — en el diseño, esto se traduce como una ligera protuberancia en la parte superior de la cabeza, oculta por el cabello verde pero visible desde atrás

#### 5.3.2 Gajito — Key lime (limón de pica)

- **Forma base**: más esférica que el limón amarillo — menos puntiaguda, más compacta
- **Color de piel**: verde lima brillante, `#8BC34A` aprox. (claramente distinto a Limonchero en escena oscura)
- **Tamaño relativo**: 75% de la altura de Limonchero — claramente más pequeño, pero no exageradamente
- **Energía del diseño**: donde Limonchero tiene líneas horizontales (gabardina, ala plana del fedora), Gajito tiene líneas verticales — ropa ajustada, postura hacia adelante, menos masa horizontal
- **Sin fedora**: Gajito no lleva fedora. El sombrero es un marcador de jerarquía en este mundo — solo los detectives experimentados lo llevan

#### 5.3.3 Commissioner Wallace Spud — Papa (patata)

- **Forma base del cuerpo**: la papa es un tubérculo ovalado e irregular — torso amorfo, asimétrico por diseño (un hombro ligeramente más alto que el otro, panza descentrada), como si la geometría del cuerpo recordara una papa cavada del suelo. Nunca perfectamente simétrico: la asimetría es su firma
- **Color de piel**: marrón tierra `#6B4423` aprox., con variación tonal en las facetas — zonas más claras `#8A5A30` en las partes altas (hombros, frente) y más oscuras `#4A2E18` en las bajas (barbilla, bajo la panza). Cáscara mate, nunca brillante. Paleta terrosa que lo separa tonalmente de todos los demás personajes (Moni-granate, Gerry-verde, Lola-naranja, Barry-amarillo)
- **Ojos de la papa (brotes)**: la papa tiene "ojos" — pequeñas hendiduras oscuras de donde brotan tallos. En el diseño, 3–4 ojos visibles distribuidos por el cuerpo (nunca en la cara — serían confusos con los ojos reales). Color `#2E1A0A`. Son el marcador frutal no negociable — si no se ven los ojos de la papa, no es una papa
- **Textura de cáscara**: granular y sucia, con suave variación de valor. En low-poly se insinúa con micro-facetas de color ligeramente más oscuro, sin normal map
- **Cabeza**: redondeada-irregular, sin tallo (la papa no tiene tallo visible). Esto lo diferencia inmediatamente de Limonchero y Gajito
- **Uniforme**: traje de comisionado de los 50 adaptado al cuerpo amorfo. Azul oscuro `#1E2A4A`, botones dorados de latón. Los planos del uniforme se distorsionan alrededor del cuerpo irregular — los botones de la chaqueta están bajo tensión visible. El contraste marrón-azul oscuro es la lectura a distancia: "autoridad terrosa"

#### 5.3.4 Barry Peel — Plátano

- **Forma base del cuerpo**: el plátano tiene una curvatura característica. El torso de Barry no es recto — tiene una ligera curva hacia adelante en la parte superior, como si el cuerpo recordara la forma de la fruta incluso en postura erecta
- **Color de piel**: amarillo suave y uniforme, `#F5D020` aprox. — más brillante y limpio que Limonchero. La piel del plátano es lisa donde la del limón es rugosa — en low-poly, esto significa caras más grandes y uniformes, menos variación de faceta a faceta
- **Manchas**: las manchas que aparecen gradualmente son el elemento de diseño más importante de Barry. Ver sección 5.4 para el protocolo de señalización visual
- **Traje**: el único personaje con traje formal impecable. El traje no debe tener ni una arruga geométrica — planos completamente planos. Esta impecabilidad geométrica es parte de su carácter

#### 5.3.5 Moni Graná Fert — Granada

- **Forma base del cuerpo**: la granada es globosa y coronada. El cuerpo de Moni tiene una silueta redondeada en el torso que se extiende hacia arriba en una **corona dentada de 5–6 puntas** (los sépalos secos de la granada) que reemplaza la función del cabello. La corona es el elemento no negociable — es su firma de silueta desde 3 metros
- **Color de piel**: rojo granada profundo, `#8B2332` aprox. Cáscara mate con facetas más oscuras en las zonas de sombra. En escena de club con iluminación de neón, este rojo se lee como contundente — es el único personaje con rojo saturado en la piel (Spud es marrón tierra, Lola naranja apagado). Solo compite con su propio vestido granate, que es intencional: Moni se lee como una sola masa roja a distancia
- **Detalle de las semillas**: en zonas del torso y los brazos, pequeñas facetas rubí `#C8102E` asoman entre grietas de la cáscara — no muchas, ~6 a 8 puntos visibles por vista. Son el segundo marcador frutal después de la corona. En low-poly: mini-polígonos saturados embebidos en planos de cáscara
- **Forma de la cabeza**: más redonda y coronada que cualquier otro personaje — la granada es vertical. La cabeza de Moni es casi esférica con la corona dentada arriba, lo que la hace leer claramente distinta de la silueta de Lola (caqui) aunque ambas tengan coronas
- **Vestido granate**: el único vestido largo femenino de la cast. Corte bajo en el escote, caída angular larga. Color `#A0202F` — cercano a la piel pero más saturado y vivo, para que la figura se lea como "una sola masa roja" a distancia y el detalle del vestido solo aparezca de cerca. Es la lectura "Femme Fatale" desde el primer frame

#### 5.3.6 Gerald Broccolini — Brócoli

- **Forma base del cuerpo**: el brócoli tiene una copa arbórea. Gerry tiene hombros y cabeza que forman una masa continua hacia arriba — la distinción cuello/cabeza/hombro está deliberadamente difuminada. Es todo una masa verde oscura en la parte superior, estrecha hacia las piernas
- **Color**: verde oscuro, `#2E4A1E` aprox. — el más oscuro de la cast. En escena de club, casi desaparece en las sombras. Esto es intencional: Gerry es seguridad, trabaja en los bordes de la escena
- **Fedora dos tallas pequeño**: el sombrero se hunde entre la masa verde de su cabeza/copa, demasiado pequeño para la estructura arbórea. Es el único detalle de comedia del personaje — nunca eliminar este elemento
- **Textura**: la copa del brócoli tiene textura granular. En low-poly, insinuar con variación de valor en textura flat (sin normal map)

#### 5.3.7 Lola Persimmon — Caqui

- **Forma base del cuerpo**: el caqui es una fruta oval con una corona en la parte superior. Lola tiene una ligera estructura de corona en el pelo — accesorio en forma de estrella de 4 puntas (los sépalos del caqui)
- **Color de piel**: naranja-marrón cálido, `#D4713A` aprox. — cálido y terroso, separado del rojo profundo de Moni por tono (naranja vs. rojo) y de la corona de Moni por el accesorio (estrella plana de caqui vs. corona dentada tridimensional)
- **Ropa**: traje de contadora de los 50 — blusa blanca, chaqueta estructurada, falda a la rodilla. Sin elementos llamativos. Es la única personaje con ropa completamente neutra

---

### 5.4 Señales Visuales de Estado y Sospecha

El diseño debe hablar sin texto. El jugador que presta atención debe recibir información visual antes de tenerla narrativamente.

#### 5.4.1 El Sistema de Manchas de Barry Peel

Este es el sistema de señalización visual más sofisticado del juego. Se define aquí exclusivamente en términos visuales — la implementación técnica es responsabilidad del programador.

**Estado inicial (inicio del juego)**
Piel completamente limpia, amarillo uniforme en toda la superficie de ambas manos. Traje impecable.

**Estado intermedio (después de ~2 interacciones con Barry)**
Manchas muy sutiles en la palma de la mano derecha. Color `#3D2B1F` sobre el amarillo base. Semi-transparentes, tamaño ~10% de la superficie de la mano. A esta escala, pueden confundirse con envejecimiento natural de la piel de plátano — eso es intencional.

**Estado avanzado (segundo acto)**
Manchas más oscuras y más extendidas. Cubren la mayor parte de la mano derecha y empiezan a aparecer en la muñeca. Ya no son ambiguas como "envejecimiento" — son claramente anomalía, pero solo si el jugador mira directamente.

**Estado final (con 2 de 3 pruebas)**
Las manchas son visibles sin necesidad de observación activa. El jugador debería notarlas espontáneamente sin buscarlas.

**Regla de diseño**: las manchas no deben leerse como "tierra" o "pintura" — deben mantener la ambigüedad de ser posiblemente envejecimiento de la piel de plátano. Un jugador distraído no las leerá como evidencia. Un jugador atento, sí.

**Entregables del artista para este sistema**:
- Textura base: mano derecha limpia (estado 0)
- Textura de mancha: máscara en escala de grises que define forma y borde de las manchas
- Los estados intermedios se obtienen por variación de opacidad — el artista solo define los extremos visuales

#### 5.4.2 Señales Pasivas por Personaje

Cada sospechoso inocente tiene un elemento visual que el jugador puede malinterpretar como señal de culpa en una primera lectura. Estas señales deben estar modeladas desde el inicio — no son animaciones, son elementos del model y textura base.

| Personaje | Señal Visual Ambigua | Lectura Inocente | Lectura Culpable (falsa) |
|---|---|---|---|
| Moni Graná Fert | Maleta pequeña visible bajo la barra | Equipaje del club | Preparándose para huir |
| Gerry Broccolini | Fedora especialmente ladeado, manos en los bolsillos | Postura de descanso | Ocultando algo en los bolsillos |
| Lola Persimmon | Dedos manchados de tinta | Trabajo con documentos | Huellas, tintas de falsificación |

#### 5.4.3 Señales de Tensión en Interrogatorio

Durante un interrogatorio, el programador puede activar variaciones de postura. El artista debe preparar al menos dos poses de referencia por personaje:

- **Pose A — Neutral**: el personaje en estado de reposo, sin presión
- **Pose B — Tensión**: cambio mínimo que el estilo low-poly puede sostener sin rigging complejo

Para estilo low-poly, "tensión" es geométrica, no naturalista:
- Hombros que suben +2–3 unidades
- Cabeza que se inclina ligeramente hacia atrás
- Brazos que se cierran hacia el cuerpo (reducción de anchura de silueta ~15%)

---

### 5.5 Reglas de Expresión Facial

El estilo low-poly impone restricciones reales en la expresividad facial. Estas reglas definen qué es posible, qué está prohibido, y cómo compensar lo que no se puede hacer con geometría.

#### 5.5.1 Lo que Funciona en Low-Poly

- **Cejas como bloques separados**: las cejas son dos planos rectangulares independientes. Rotar un plano ~15° comunica escepticismo, sospecha o ironía de forma inmediata. Es la herramienta expresiva más eficiente del estilo
- **Ángulo de boca**: definido por la orientación del edge central — horizontal es neutral, diagonal hacia abajo es desaprobación, diagonal hacia arriba es satisfacción
- **Apertura de ojo**: reducir la altura del polígono de ojo a ~60% de la apertura máxima comunica cansancio o sospecha. Limonchero usa esta configuración como estado base (ver concept sheet — "expresión escéptica")
- **Posición de la boca en el plano de la cara**: bajar la boca (más espacio entre nariz y boca) comunica madurez y seriedad. Subir la boca comunica juventud o energía

#### 5.5.2 Lo que Está Prohibido

- **Morphs de cara completa**: el presupuesto de polígonos no permite blend shapes complejos en Quest 2. No planificar expresiones que requieran deformación de más de 3 regiones faciales simultáneamente
- **Arrugas geométricas**: no intentar modelar arrugas de expresión — en este estilo y presupuesto no se leen, solo añaden ruido visual
- **Labios detallados**: los labios son una línea de borde con ligero bisel — no modelar labio superior e inferior por separado
- **Ojos como sprite/billboard**: en VR el parallax binocular los hace flotar visualmente — usar geometría siempre

#### 5.5.3 Escala de Expresividad por Personaje

No todos los personajes tienen el mismo rango expresivo. Esto es intencional y debe quedar fijo en el modelo.

| Personaje | Rango Expresivo | Justificación Narrativa |
|---|---|---|
| Gajito | Alto — cejas móviles, boca activa | Su nerviosismo requiere que el rostro traicione lo que siente |
| Commissioner Spud | Medio-alto — ceño prominente, boca tensa | La impaciencia se lee en cada plano facial |
| Moni Graná Fert | Bajo-medio — sonrisa lenta calculada, ojos en media apertura constante | La femme fatale controla cada gesto; la calma es el arma |
| Lola Persimmon | Medio — animada pero no extrema | La cooperación excesiva se lee en rapidez del gesto, no en exageración |
| Gerry Broccolini | Muy bajo — casi sin expresión | Monosilábico en todo, incluyendo la cara |
| Barry Peel | Casi nulo — microexpresiones únicamente | La serenidad absoluta como señal de alarma |

**Regla para Barry**: su cara es la más difícil de modelar correctamente porque hace casi nada. La boca está en la misma posición en todas las interacciones. Los ojos tienen una apertura del 70% constante — ni muy abiertos (sorpresa) ni cerrados (cansancio). Es la geometría de alguien que controla cada músculo.

#### 5.5.4 Ojos en VR — Consideración de Escala

A distancia de conversación (~1–1.5 metros), los ojos son el punto focal del NPC en VR:
- Mínimo 8 polígonos por ojo
- El iris debe ser claramente diferenciado por color en la textura
- No usar billboard/sprite para los ojos

---

### 5.6 Guía de Vestuario Noir-Frutícola

La moda noir de los 50 asume un cuerpo humano: manos con cinco dedos, cabeza sin tallo, torso con cuello definido. Los cuerpos de frutas no tienen nada de eso. Estas reglas adaptan el vestuario al mundo.

#### 5.6.1 El Problema del Tallo

Muchas frutas tienen tallo. El tallo en la cabeza rompe cualquier sombrero convencional. Soluciones estandarizadas:

**Solución A — Ranura Dorsal** (para sombreros sólidos como el fedora): la copa tiene una ranura en la parte posterior que permite al tallo salir sin deformar el sombrero. La ranura es parte del diseño, no un arreglo — es un detalle de moda noir-frutícola. Limonchero usa esta solución (verificable en el concept sheet: el cabello verde sale por la parte trasera del fedora).

**Solución B — Corona Abierta** (para gorras y tocados): sombreros con corona abierta o ajustable. Funciona para personajes con cabeza redondeada irregular como Spud.

**Solución C — Sin Sombrero**: para personajes cuya masa superior hace imposible cualquier sombrero convencional. El fedora de Gerry es humorístico precisamente porque no puede resolverse bien — se hunde en la copa arbórea.

**Regla**: el sombrero nunca flota sobre la cabeza. Siempre hay contacto geométrico.

#### 5.6.2 El Problema de las Manos

Las manos de fruta son masas geométricas, no dedos individuales.

- **Guantes**: extensión lisa de la mano — masa geométrica diferente en color/material a la piel. No modelar dedos de guante individuales
- **Anillos**: toro geométrico simple alrededor de una protuberancia del bloque de mano. Solo si el personaje lo justifica narrativamente
- **Poses de mano**: preparar al menos 3 por personaje (neutral, señalando, cerrada)

#### 5.6.3 Adaptaciones Específicas por Vestuario

**Fedora (Limonchero)** — reglas no negociables:
- Copa con facetas visibles — nunca suavizar
- Ala plana con al menos 2 planos visibles (no un toro liso)
- Banda como strip de color más oscuro que la copa
- Ranura posterior limpia — el cabello verde sale sin empujar el sombrero hacia arriba

**Gabardina (Limonchero)**:
- Pliegues como planos angulares abruptos — no curvas orgánicas
- Cinturón como strip geométrico recto, nudo solo insinuado
- Preparar dos variantes: cuello levantado (pose noir) y cuello plano

**Vestido de Moni (granate)**:
- Cuerpo ajustado arriba con corte bajo, falda larga en vuelo angular — serie de planos, no tela continua
- El granate `#A0202F` del vestido es el punto de mayor saturación de toda la cast. Lee como una sola masa roja con la piel de granada; el detalle se revela de cerca. No añadir colores secundarios que compitan

**Traje de Barry**:
- Negro intenso, sin variación de material entre chaqueta, pantalón y chaleco
- Pañuelo de bolsillo blanco: único punto de blanco en toda su figura — punto focal durante el interrogatorio
- Botones: polígonos esféricos simples, 4–6 polígonos cada uno

**Uniforme de Spud (comisionado)**:
- Azul oscuro, hombreras geométricas
- Galones dorados en mangas: strips de color en textura flat, no geometría separada
- Botones frontales bajo tensión visible — los planos de la chaqueta se abren alrededor de la panza

---

### 5.7 LOD y Legibilidad en VR

Meta Quest 2 con mobile renderer requiere mínimo 2 LODs por personaje. La legibilidad en VR tiene reglas específicas que no aplican en monitor.

#### 5.7.1 Definición de LODs

**LOD 0 — Distancia de conversación (0–2 metros)**
- Presupuesto: 2.000–3.000 triángulos por personaje
- Todos los elementos de identidad visibles: expresión facial, detalles de vestuario
- Textura: 1024×1024 preferido, 512×512 mínimo

**LOD 1 — Distancia media (2–6 metros)**
- Presupuesto: 800–1.200 triángulos por personaje
- Se eliminan: detalles faciales internos, botones individuales, galones de textura fina
- Se mantienen: silueta completa, colores base, elemento de identidad dominante (fedora, vestido rojo, etc.)
- Textura: 512×512, puede ser atlas compartido

**LOD 2 — Distancia larga (>6 metros)** *(opcional)*
- Presupuesto: 300–500 triángulos
- Solo silueta y color base — el personaje se lee como "figura con fedora" o "figura roja", no como individuo
- Textura: 256×256 en atlas global de personajes de fondo
- Implementar solo si el rendimiento lo requiere

#### 5.7.2 Los Cuatro Elementos de Identidad de Cada Personaje

Estos elementos se preservan hasta LOD 1. Solo pueden eliminarse en LOD 2.

| Personaje | E1 (silueta) | E2 (color dominante) | E3 (accesorio clave) | E4 (detalle secundario) |
|---|---|---|---|---|
| Limonchero | Fedora + gabardina | Amarillo-verdoso | Cabello verde | Camiseta con gato |
| Gajito | Altura baja, cabeza grande | Verde lima brillante | Sin sombrero | Ropa ajustada |
| Barry Peel | Traje limpio, porte recto | Amarillo uniforme | Pañuelo blanco | Manchas en mano |
| Commissioner Spud | Masa amorfa asimétrica | Marrón tierra | Uniforme azul oscuro | Ojos de papa (brotes) + galones dorados |
| Moni Graná Fert | Figura en A + corona dentada | Granate profundo | Vestido granate completo | Corona + semillas rubí asomando |
| Gerry Broccolini | Masa arbórea superior | Verde oscuro | Fedora hundido | Manos en bolsillos |
| Lola Persimmon | Oval compacta, postura erguida | Naranja-marrón | Traje estructurado | Corona de caqui en pelo |

#### 5.7.3 Prueba de Legibilidad Obligatoria

Antes de aprobar cualquier modelo de personaje:

1. Colocar el modelo en escena de club con iluminación noir (luz principal lateral, 60% del cuerpo en sombra)
2. Capturar screenshot a resolución Quest 2 (1832×1920 por ojo)
3. Reducir la imagen al 25% de tamaño — simula la percepción a ~4 metros
4. La silueta debe ser reconocible sin conocer el nombre del personaje
5. Si no pasa, revisar E1 (silueta) antes de cualquier otro cambio

**Regla adicional para VR**: revisar siempre el modelo en vista 3/4 lateral, no solo en frontal. La vista 3/4 es la vista de facto durante una conversación en VR.

#### 5.7.4 Atlas de Texturas — Estrategia de Agrupación

Para mantenerse dentro del presupuesto de draw calls (<100 por frame):

- **Atlas A — Asistente**: Gajito (siempre presente junto al jugador)
- **Atlas B — Sospechosos**: Moni + Gerry + Lola (raramente en frame simultáneo completo)
- **Atlas C — Autoridad y Culpable**: Spud + Barry (interacciones clave de alta calidad)
- **Textura de manchas de Barry**: archivo separado por su naturaleza dinámica — no incluir en atlas general

---

### 5.8 Nombres de Archivo — Personajes

Convención: `[category]_[name]_[variant]_[lod].[ext]`

```
char_limonchero_idle_lod0.mesh
char_limonchero_trench_open_lod0.mesh       ← gabardina con cuello levantado
char_limoncito_idle_lod0.mesh
char_limoncito_idle_lod1.mesh
char_barry_idle_lod0.mesh
char_barry_hand_stain_mask.png              ← máscara de manchas (dinámica, no en atlas)
char_beet_idle_lod0.mesh
char_vivi_idle_lod0.mesh
char_gerry_idle_lod0.mesh
char_lola_idle_lod0.mesh
atlas_assistant_lod0.png                    ← atlas A
atlas_suspects_lod0.png                     ← atlas B
atlas_suspects_lod1.png
atlas_authority_lod0.png                    ← atlas C
```

---

## 6. Environment Design Language

## 6.1 Estilo Arquitectónico

### Identidad: Art Deco Decadente de Segunda Categoría

El Agave y La Luna no es un gran club de primera línea. Es un club que **aspira a serlo** — y esa tensión entre aspiración y realidad es el vocabulario visual del espacio. La arquitectura es Art Deco de los años 30 tardío que ha sido remendada, repintada y desgastada durante veinte años. Los ángulos geométricos del Art Deco sobreviven en los marcos, las molduras y los candelabros, pero las superficies tienen la fatiga de algo que ya tuvo su momento de gloria.

### Vocabulario Arquitectónico Obligatorio

**Elementos que DEBEN aparecer en el espacio:**

- **Pilastras falsas** — columnas planas decorativas de yeso pintado `#2A1B0E` que articulan las paredes del salón principal. No son columnas reales; son adorno que finge estructura. Altura completa de pared (4.5m). Capitel simplificado, sin ornamento curvo — solo ángulos de 45°.
- **Molduras de techo en escalones** — el techo del salón principal lleva tres niveles descendentes hacia el centro: el primero a `#1A130A`, el segundo a `#231A10`, el tercero (nivel más bajo, plano central) a `#2A1F14`. Las molduras entre niveles miden ~12cm de altura, perfil recto con bisel único a 45°.
- **Suelos de patrón geométrico** — hexágonos o rombos alternados. Color base crema cálido `#E8DFC8` con acento negro-cálido `#1E1810`. El patrón se interrumpe en zonas traseras (concreto desnudo) — la ruptura es intencional y narrativa.
- **Arcos de perfil recto** — sin curva en los vanos de paso. Los arcos son trapezoïdales: base ancha, apertura ligeramente más estrecha que la base. Grosor del arco: ~20cm.
- **Madera oscura de caoba simulada** — panelado en la mitad inferior de las paredes del salón y vestíbulo, hasta ~1.5m. Color `#2A1B0E`, tono `#3D2A12` en piezas más brillantes. El panelado tiene ranuras verticales cada ~15cm — estas son caras planas en la geometría, no texturas.
- **Vidrio esmerilado en apliques** — todos los apliques de pared usan vidrio esmerilado (flat-shaded, semitransparente en el material, sin detalle interno). Color base del vidrio: `#D4B87A` con emisión débil.
- **Techo de lata prensada (tin ceiling)** — en vestíbulo y partes del salón. Patrón geométrico repujado representado como facetas en la geometría (no textura). Color `#7A6040` con zonas de `#8A7050` donde hay reflejo difuso de la iluminación cálida.

### Lo que NO existe en este espacio

- Sin curvas orgánicas en arquitectura (reservadas únicamente para cuerpos de personajes-fruta).
- Sin ventanas al exterior en zonas interiores del club, excepto las puertas de vidrio del vestíbulo y la ventana lateral de la oficina (Zona 5).
- Sin iluminación natural. Todo es artificial. Si se filtra algo del exterior, es el neón verde de la marquesina.
- Sin espacio simétrico, excepto la mesa de interrogatorio (Zona 6, simétrica por diseño narrativo deliberado).

---

## 6.2 Filosofía de Textura

### Elección: Flat-Shaded Estilizado con Variación de Valor por Faceta

**La decisión:** El juego usa materiales **flat-shaded estilizados** — sin normal maps, sin PBR completo, sin texturas fotorrealistas de alta frecuencia. Cada polígono recibe un color uniforme modulado por la iluminación de escena. El "detalle" visual viene de la geometría en sí (facetas angulares visibles) y de la variación tonal deliberada por zona.

**Por qué no PBR completo:** PBR realista entra en conflicto directo con la estética low-poly frutícola de los personajes. Si el entorno es fotorrealista y los personajes son facetados y saturados, el contraste visual hace que los personajes parezcan assets importados de otro juego. La coherencia visual requiere que el entorno y los personajes compartan el mismo lenguaje de abstracción.

**Por qué no painted flat tipo Night in the Woods:** Night in the Woods usa 2D con ilustración. Este juego es 3D en primera persona — la ilusión de espacio tridimensional requiere que la iluminación de escena modifique los valores tonales de las superficies. Los materiales deben reaccionar a la luz del motor (Godot Forward+), no simular iluminación en textura.

**Por qué esta elección funciona para este juego:** Disco Elysium usa paletas de color deliberadas para codificar zonas emocionales. Return of the Obra Dinn usa la restricción visual para crear peso. Este juego toma de ambos: los materiales flat-shaded permiten que el **color de la luz** domine la lectura visual, que es exactamente lo que necesita el lenguaje noir — el entorno se tiñe de la fuente de luz más cercana.

### Especificaciones para Blender

**Configuración de materiales en Blender (para exportar a Godot):**

| Parámetro | Valor |
|-----------|-------|
| Shader principal | Principled BSDF con Roughness = 1.0 (sin reflejo especular) |
| Metallic | 0.0 en todo, excepto herrajes metálicos (0.8) y vidrio (ver abajo) |
| Subsurface | 0.0 — sin subsurface en entornos |
| Transmission | 0.0 excepto vidrio esmerilado (0.15) y botellas (0.6) |
| Emission | Solo en fuentes de luz directas (tubos neón: 2.5 strength; filamentos de bombilla: 1.2 strength) |
| Normal Map | NO usar en superficies arquitectónicas. Permitido únicamente en telas y tapicería (intensidad ≤ 0.3) |
| Smooth Shading | DESACTIVADO en toda geometría arquitectónica. Auto Smooth desactivado. Flat shading explícito. |
| Shade Smooth | Solo en esferas de fruta de personajes — no exportar entornos con shade smooth activado |

**Paleta de materiales base (antes de luz):**

| Material | Color base | Roughness | Notas |
|----------|------------|-----------|-------|
| Paredes enlucidas (salón) | `#3A2A1A` | 1.0 | Yeso viejo, tono tierra |
| Panelado de madera caoba | `#2A1B0E` | 0.85 | Sin reflejo, solo variación tonal por faceta |
| Suelo hexagonal (crema) | `#E8DFC8` | 0.9 | Ligeramente más brillante que paredes |
| Suelo hexagonal (negro) | `#1E1810` | 0.95 | — |
| Tela de tapicería (reservados) | `#1E3228` | 1.0 | Verde oscuro, terciopelo simulado |
| Tela de tapicería (escenario) | `#0D2020` | 1.0 | Teal-negro profundo |
| Concreto desnudo (zonas traseras) | `#4A4035` | 1.0 | Sin acabado, poroso |
| Metal herrería (negro) | `#1A1510` | 0.3 | Algo de brillo, metal oxidado |
| Metal latón | `#C8A040` | 0.4 | Herrajes, marcos de espejo |
| Vidrio esmerilado | `#C8A060` | 0.1 | Semi-opaco, leve emisión |
| Papel tapiz geométrico | `#2E4A1E` | 1.0 | Solo en reservado de Barry |

---

## 6.3 Reglas de Densidad de Props

### Principio rector: La densidad comunica uso y clase social

Cada área del club tiene una densidad de props calculada para comunicar su función narrativa y su posición en la jerarquía del espacio. Un espacio más rico en props no es mejor — es más cargado de historia, lo que implica mayor riqueza o mayor decadencia según el contexto.

### Escala de densidad (1–5)

| Nivel | Props visibles en pantalla | Aplicación |
|-------|---------------------------|------------|
| 1 | 2–4 objetos | Pasillo de servicio, sala de interrogatorio |
| 2 | 5–8 objetos | Vestíbulo, oficina de Cornelius |
| 3 | 9–14 objetos | Almacén/bodega |
| 4 | 15–22 objetos | Barra principal |
| 5 | 23–35 objetos | Salón principal (incluyendo crowd) |

### Reglas por área

**Barra principal (densidad 4):**
- Props de servicio en superficie de barra: máximo 6 objetos de servicio activos (vasos, coctelera, paño, cenicero de mostrador, botella de apertura, sifón). Agrupados en dos clusters, no dispersos linealmente.
- Estantería retroiluminada: máximo 3 filas. Fila superior: 5 botellas altas; fila media: 8 botellas medianas; fila baja: 4 botellas con vasos entre ellas. Las botellas son instancias de 3–4 modelos únicos con variaciones de escala (0.9× a 1.1×).
- Bajo la barra: invisible al jugador en primera persona a menos que Gerry se aparte — no modelar con detalle.
- Taburete de barra: 4 unidades, alternadas entre cerca y alejadas del mostrador para sugerir ocupación reciente.

**Salón principal / pista de baile (densidad 5):**
- Pista de baile central (8m × 8m): **vacía de props**. Solo suelo hexagonal. La ausencia de obstáculos es intencional — es el espacio de legibilidad del jugador para leer todas las siluetas a su alrededor.
- Mesas de gala: 8–10 mesas redondas de ~0.9m de diámetro. Cada mesa lleva: mantel, 2–3 vasos, 1 cenicero, 1 lámpara de mesa pequeña, 1 florero mínimo. Las mesas del fondo (crowd) llevan solo mantel y silueta de prop — sin detalle.
- Reservado de Barry (NW): Mesa rectangular, 2 sillas, 1 copa de bourbon, 1 cenicero limpio, el acuerdo del fideicomiso boca abajo bajo el vaso. Alcoba recesada 0.6m — la profundidad crea sombra natural sobre Barry sin props adicionales.
- Escenario jazz: Piano de cola, micrófono de pie, 2 sillas de músico, atril de partituras, 1 bajo contrabajo apoyado contra la pared del fondo. No superar 8 props en el escenario — el espacio del escenario es el fondo visual más visible desde el centro del salón.

**Bodega/almacén (densidad 3):**
- El principio visual es **acumulación estructurada**: las cajas y sacos se apilan en filas ortogonales, no caóticamente. El caos visual viene de las alturas variables, no de la posición en planta.
- Ángulo muerto NE (donde está la maleta de Moni): debe quedar oscuro visualmente desde la puerta. Lograr esto con geometría — una columna de cajas de ~1.8m que corta la línea de visión — no solo con oscuridad de luz.
- Props obligatorios: estantería piso-techo (oeste), 12–15 cajas de madera apiladas en 3 columnas, 3–4 sacos de arpillera (harina/azúcar), silla plegable junto a la puerta trasera, puerta de servicio metálica (semiabierta), candado colgante en estantería.

**Pasillo de servicio (densidad 1):**
- El pasillo debe estar **vacío de props decorativos**. Lo que existe aquí son elementos de utilidad industrial: tres focos de trabajo colgantes, tubería de cobre en la pared este (sin branches complejos — una línea recta), una ventana alta rectangular de vidrio opaco con la tira de neón verde exterior visible.
- La colilla de palillo de canela junto a la escalera y la huella de barro de Barry son los únicos props "activos" narrativamente. Deben ser visibles pero pequeños — a escala realista, no aumentados para la jugabilidad.
- La escalera es el único elemento arquitectónico complejo en este pasillo. Pasamanos metálico, escalones de madera sin alfombrar, giro en el rellano. Máximo 14 escalones visibles antes del giro.

**Oficina de Cornelius (densidad 2–3):**
- Escritorio mahogany: superficie con lámpara volcada, copia del acuerdo, contorno rectangular de polvo donde estaba el acuerdo original, bandeja de documentos, pisapapeles. Máximo 6 objetos sobre el escritorio.
- Caja fuerte abierta (pared este): interior visible con documentos y el negativo de la combinación escrito bajo el cajón. No llenar la caja fuerte de props — la apertura dramática es el mensaje, no el contenido.
- Archivadores (2 unidades): pared norte, junto al escritorio. Cajones cerrados excepto uno ligeramente abierto con documentos visibles.
- Recuadro enmarcado en la pared: periódico vintage de la época de inauguración del club. Texto ilegible (geometría de caja plana).
- La alfombra persa bajo el escritorio: plana, con patrón geométrico bajo en la geometría (una faceta central diferente de las orillas). El encendedor F3 está en el borde de esta alfombra — modelar el borde con un levantamiento de ~2cm para que el encendedor quede semioculto de forma creíble.

**Sala de interrogatorio (densidad 1):**
- Mesa rectangular centrada: única geometría perfectamente simétrica en el juego. Superficie: bloc de notas, 2 vasos de agua (sin llenar), 1 cenicero limpio. Máximo 3 objetos.
- Dos sillas exactamente opuestas. Sin otros props.
- Espejo unidireccional (pared sur): marco de metal negro, superficie reflectante apagada (Roughness 0.2, sin distorsión). Es el único elemento reflectante del juego — su presencia es narrativamente cargada.
- La austeridad es la intención. Cualquier prop adicional diluye la tensión.

---

## 6.4 Environmental Storytelling

### Principio: Cada área del club tiene una historia que contar sin texto

La escena del crimen ya ocurrió. El jugador llega después. El entorno es el testimonio mudo. Cada prop fuera de lugar, cada objeto con uso evidente pero estado anómalo, comunica algo sobre lo que pasó.

### Gramática del objeto narrativo

Un objeto narrativo cumple siempre al menos una de estas funciones:
1. **Establece estado previo** — muestra cómo estaba antes de que algo ocurriera.
2. **Marca la anomalía** — su posición, estado o condición es inusual respecto al entorno.
3. **Implica un agente** — sugiere quién estuvo aquí o qué hizo.

### Objetos narrativos por zona y su lectura

**Zona 1 — Vestíbulo:**
- Coat #14 entre abrigos similares: todos los abrigos cuelgan uniformemente; el #14 está ligeramente más separado del gancho anterior, como si alguien lo hubiera movido en la oscuridad. Esa separación de ~5cm es la anomalía.
- El cenicero sobre el talón: el cenicero está exactamente centrado sobre el mostrador, como lo pondría alguien que quiere que no lo muevan. El jugador que levanta un cenicero perfectamente centrado ha aprendido a notar el orden excesivo como señal.

**Zona 2 — Salón principal:**
- Copa de bourbon de Barry a medio tomar y sin condensación bajo el vaso: el vaso lleva mucho tiempo ahí. Un hombre que espera algo en el que ya no tiene apetito.
- El acuerdo del fideicomiso boca abajo bajo el vaso: el documento está oculto por el vaso — una ocultación torpe, de alguien que no quería que lo vieran mirando el papel pero no lo escondió de verdad.
- Cenicero de Moni con boquilla: el cigarrillo está a medio fumar y extinguido — no aplastado, solo apagado. Moni se fue antes de terminarlo. La boquilla tiene marca de carmesí en el extremo. Establece el hábito del encendedor.
- Silla del músico vacía frente al piano: el piano tiene partituras abiertas, la silla está empujada hacia afuera (no recogida). Alguien dejó de tocar de repente.

**Zona 3 — Bodega:**
- Silla plegable junto a la puerta trasera con huella del asiento en el polvo: la silla estuvo ocupada durante mucho tiempo. La huella indica que alguien se sentó regularmente aquí. La silla está vacía ahora — la ausencia es la pista.
- La columna de cajas en el ángulo NE: una caja está ligeramente fuera de alineación con las demás, como si alguien la hubiera movido y recolocado sin prestar atención a la fila. Sugiere que alguien accedió a ese espacio.
- La puerta trasera metálica entreabierta: una puerta de servicio de metal se mantiene cerrada por peso propio. Si está entreabierta, alguien la dejó así recientemente.

**Zona 4 — Pasillo de servicio:**
- La huella de barro de Barry: entre el 2° y 3° pool de luz. Es una suela de zapato de vestir, no de trabajo. En un pasillo de servicio donde solo entran empleados con zapatos de trabajo, una suela de cuero fino es una anomalía de clase.
- La colilla de palillo de canela: Barry mastica palillos de canela (establecido en el Cast Bible con el olor del club). La colilla está en la base de la escalera — la dejó antes de subir, como quien se quita los nervios antes de un umbral decisivo.
- Los pools de luz con tramos oscuros entre ellos: el pasillo no está uniformemente iluminado. Los focos crean islas de visibilidad. Entre las islas, el jugador camina a ciegas. Esta rítmica luminosa es intencionada — es la tensión de la ruta de acceso de Barry.

**Zona 5 — Oficina de Cornelius (escena del crimen):**
- Elementos obligatorios con lectura narrativa específica:

| Elemento | Estado visual | Lectura |
|----------|--------------|---------|
| Lámpara de escritorio volcada | Base visible desde el umbral. El cable está tenso — cayó hacia la izquierda del escritorio, lo que implica que alguien la derribó de ese lado al forcejear o al caer. | Violencia física en ese ángulo específico |
| Caja fuerte abierta | La puerta está completamente abierta, no entreabierta. Los documentos que quedan dentro están desorganizados — algunos parcialmente sacados. | Alguien buscó algo y lo encontró |
| Contorno de polvo rectangular en el escritorio | Un rectángulo limpio de ~30cm × 20cm donde no hay polvo, rodeado de polvo uniforme. Un documento estuvo aquí durante semanas. Ya no está. | El acuerdo fue retirado, no cayó |
| Ventana lateral abierta con pestillo en "cerrado" | La ventana está abierta. El pestillo señala "cerrado desde dentro". Para lograr esto hay que conocer el truco del mecanismo — moneda para rotar el pestillo desde afuera. | No fue un intruso casual — alguien que conocía la oficina |
| Alfombra con borde levantado y encendedor (F3) | El borde de la alfombra está ligeramente levantado en una esquina, como si alguien tropezara o se inclinara aquí. El encendedor está en ese borde, semioculto — cayó del bolsillo al agacharse o correr. | El propietario del encendedor estuvo en ese rincón específico |
| Periódico enmarcado (inauguración del club) | Foto de Cornelius y Barry padre en la inauguración, veinte años atrás. Barry padre aparece sonriendo. Cornelius aparece mirando la cámara con la misma calma que Barry hijo usa ahora. | El ciclo de poder tiene historia |

**Zona 6 — Sala de interrogatorio:**
- Bloc de notas con indentaciones: bajo luz oblicua (la única luz de la sala), las indentaciones del bloc revelan el mismo encabezado del acuerdo del fideicomiso. Alguien usó este bloc para presionar mientras firmaba. O intentó firmar. O decidió no hacerlo.
- La ausencia de marcas de desgaste en las paredes: las otras zonas del club tienen 20 años de desgaste visible en superficies. La sala de interrogatorio no — fue construida más tarde, o menos usada, o ambas cosas.

---

## 6.5 Paleta de Escenarios

### Sistema de paleta: Cuatro zonas cromáticas para cuatro registros emocionales

El espacio del club no es cromáticamente uniforme. Cada zona tiene un registro de color que comunica su función narrativa y su relación con el poder dentro del espacio.

### Zona A — Espacio público de lujo (Vestíbulo + Salón principal)

Esta es la cara pública del club. La paleta es **ámbar cálido con destellos de verde neón**. El calor es artificial y deliberado — es la ilusión de opulencia.

| Elemento | Color | Hex | Notas |
|----------|-------|-----|-------|
| Paredes (enlucido) | Ocre oscuro | `#3A2A1A` | Base neutra que acepta luz ámbar |
| Panelado de madera | Caoba oscura | `#2A1B0E` | Mínimo 40% de las paredes inferiores |
| Suelo (crema) | Marfil cálido | `#E8DFC8` | Hexágonos alternados |
| Suelo (oscuro) | Negro cálido | `#1E1810` | Hexágonos alternados |
| Molduras de techo | Tierra media | `#5A4030` | Perfil plano, sin ornamento curvo |
| Techo de lata prensada | Bronce viejo | `#7A6040` | Con zonas de `#8A7050` |
| Tapicería de reservado | Verde cazador | `#2E4A1E` | Solo reservado de Barry (NW) |
| Tapicería de escenario | Teal-negro | `#0D2020` | Fondo del escenario jazz |
| Luz ambiental dominante | Ámbar cálido | `#D4903A` | Temperatura 2700K |
| Tinte de neón (superficies verticales) | Verde aceituna | `#5A7A2E` | Solo en superficies verticales — nunca suelo en zona pública |
| Candelabro (Zona 1) | Dorado opaco | `#F5DFA0` | Con emisión débil 0.3 |

### Zona B — Espacio de transición y servicio (Bodega + Pasillo)

El club muestra su esqueleto. La paleta es **tierra industrial sin decoración**. La ausencia de ámbar es la señal más clara al jugador de que ha cruzado una frontera de clase.

| Elemento | Color | Hex | Notas |
|----------|-------|-----|-------|
| Paredes de concreto | Gris tierra | `#4A4035` | Sin pintura, sin acabado |
| Suelo de concreto | Gris más oscuro | `#3A3028` | Manchas de humedad en `#302820` |
| Cajas de madera | Marrón oscuro | `#4A3020`–`#6B4423` | Rango deliberado para no chocar con Lola |
| Sacos de arpillera | Beige desaturado | `#8A7A5A` | Sin saturación |
| Luz única (Zona 3) | Foco cálido industrial | `#D4903A` | Una sola fuente, sombras duras |
| Luz única (Zona 4) | Incandescente trabajo | `#C88030` | Tres pools, no continuos |
| Tira de neón (ventana Zona 4) | Verde aceituna | `#5A7A2E` | Única vez que el neón toca el suelo |
| Puerta de servicio metálica | Gris oxidado | `#5A5048` | Herrumbre en `#6A4030` |

### Zona C — Oficina de poder (Zona 5)

El espacio de Cornelius es la **negación del calor**. La paleta es fría-neutra. Sin ámbar, sin verde neón. La calidez fue Corn — ya no está.

| Elemento | Color | Hex | Notas |
|----------|-------|-----|-------|
| Paredes (madera oscura) | Caoba fría | `#1E1A14` | Más fría que el salón |
| Suelo (alfombra persa) | Granate desaturado | `#4A2A1E` | Patrón geométrico bajo en geometría |
| Suelo (madera bajo alfombra) | Caoba gastada | `#2A1E14` | Visible en bordes |
| Escritorio mahogany | Casi negro-caoba | `#1A1208` | La pieza más oscura de mobiliario |
| Archivadores | Verde gobierno | `#2A3A2A` | Burocracia, poder del Estado |
| Luz única (lámpara volcada) | Blanco-frío | `#E8E4D8` | Temperatura 4000K — la única luz fría del juego |
| Caja fuerte (metal) | Gris frío | `#4A4A48` | Casi acromático |
| Luz ambiental | Muy bajo, neutro | `#1A1A18` | Apenas detalle en sombras |

### Zona D — Sala de rendición de cuentas (Zona 6)

La sala de interrogatorio es el espacio más **cromáticamente severo** del juego. La paleta es casi monocromática oscura, con el único acento siendo la luz del foco sobre la mesa.

| Elemento | Color | Hex | Notas |
|----------|-------|-----|-------|
| Paredes | Negro-café | `#1E1810`–`#2A2020` | Sin rojo cálido — Moni debe ser el único rojo de esta sala |
| Mesa | Madera neutra oscura | `#2A2218` | Sin caoba — más fría |
| Sillas | Madera + tapizado oscuro | `#1E1A10` + `#181410` | — |
| Espejo unidireccional | Marco negro | `#0E0E0C` | El único elemento reflectante del juego |
| Bloc de notas | Blanco amarillento | `#E8E0C8` | Alto contraste sobre la mesa |
| Luz única (foco cenital) | Blanco-cálido | `#F0E8D0` | Temperatura 3200K |
| Luz ambiental | Prácticamente nula | `#100E0C` | Contraste máximo con el foco |

### Coherencia con la paleta de personajes

La paleta de escenarios está diseñada para maximizar la legibilidad de cada personaje en su posición canónica:

| Personaje | Color dominante | Fondo canónico | Contraste |
|-----------|----------------|----------------|-----------|
| Barry Peel | Amarillo `#F5D020` | Verde oscuro `#2E4A1E` (papel tapiz reservado) | Alta diferencia de matiz, mínimo 30% valor |
| Moni Graná Fert | Granate `#8B2332` | Ámbar de mesa `#D4903A` (lámpara de mesa) | La lámpara hace rim light, no compite en matiz |
| Gerry Broccolini | Verde brócoli `#4A7A2A` | Estanterías retroiluminadas ámbar | El ámbar crea rim light que separa su silueta verde del fondo oscuro |
| Lola Persimmon | Naranja-marrón caqui `#C8703A` | Mesa centro-sur, luz de sala | Su tono cálido se separa de las sillas más frías |
| Commissioner Spud | Marrón-tierra papa `#C8A050` | Tiles hexagonales `#1E1810` (suelo vestíbulo) | Contraste alto con el suelo oscuro |

---

## 6.6 Iluminación de Escenarios

### Principio: La luz es autoría, no accidente

En un juego noir, la iluminación no ilumina el espacio — **define qué existe y qué no existe**. Las zonas sin luz no son vacíos técnicos; son espacios que el diseñador elige no mostrar. Cada fuente de luz tiene un propósito narrativo.

### Glosario de fuentes de luz del club

**L1 — Neón de marquesina exterior**
- Color: `#5A7A2E` (verde aceituna, más frío que el interior)
- Temperatura: 5500K (frío-verde)
- Comportamiento: Solo entra por las puertas de vidrio del vestíbulo y la ventana alta del pasillo de servicio. En el vestíbulo se deposita en superficies verticales únicamente (paredes, paneles, caras de personajes que miran hacia las puertas). Nunca toca el suelo del vestíbulo.
- Intensidad: 0.4 (moderada — presente, no dominante)
- En Blender: Area Light rectangular, orientado hacia el interior del vestíbulo desde el exterior, con cookie de máscara para limitar proyección al suelo.

**L2 — Candelabro asimétrico (Zona 1)**
- Color: `#F5DFA0` (dorado pálido)
- Temperatura: 2400K (muy cálido)
- Comportamiento: Luz puntual principal del vestíbulo. Asimétrica — cuelga ligeramente desplazada del centro hacia el norte, creando un lado del vestíbulo más iluminado (el de Commissioner Spud) y uno más sombrío (el de los abrigos).
- Intensidad: 1.2
- Sombras: Sí, medium resolution. Las barras del candelabro crean patrón de sombra geométrica en el techo de lata prensada.
- En Blender: Point Light con falloff cuadrático estándar. Agregar geometry del candelabro como emisor secundario (Emission 0.4) para que sea visible como fuente.

**L3 — Estanterías retroiluminadas de la barra (Zona 2)**
- Color: `#C88030` (ámbar profundo)
- Temperatura: 2200K (muy cálido, casi naranja)
- Comportamiento: Luz de área horizontal detrás de las botellas de la estantería. Las botellas filtran y fragmentan la luz. El efecto resultante son rayos discontinuos de luz ámbar que crean el rim light sobre Gerry y dan calidez a la barra.
- Intensidad: 0.8
- En Blender: Area Light plana horizontal detrás de la estantería. Los modelos de las botellas actúan como oclusores parciales — aprovechar esto para que la luz sea irregular sin efectos adicionales.

**L4 — Lámparas de mesa (Zona 2, mesas de gala)**
- Color: `#D4A050` (ámbar cálido)
- Temperatura: 2700K
- Comportamiento: Cada lámpara de mesa es una fuente puntual débil de corto alcance (radio efectivo ~0.8m). Iluminan la mesa y dan fill light suave ascendente a los personajes sentados. La mesa de Moni tiene una lámpara ligeramente más intensa que las otras (Intensidad 0.6 vs 0.4) para garantizar su legibilidad.
- En Blender: Point Light por lámpara, con falloff agresivo (quadratic con multiplicador 2.0). Modelar pantalla de la lámpara como bloqueador de luz superior.

**L5 — Foco spot del escenario jazz (Zona 2)**
- Color: `#FFE8B0` (blanco-cálido, casi blanco)
- Temperatura: 3200K
- Comportamiento: El único foco de haz dirigido en el espacio público. Ilumina el centro del escenario. Genera la zona más luminosa del salón — el escenario es el polo de atracción visual desde cualquier punto del salón principal.
- Intensidad: 2.0
- Sombras: Sí, alta resolución. El borde del haz es duro (penumbra mínima).
- En Blender: Spot Light, ángulo de haz 35°, blend 0.1 (borde casi duro).

**L6 — Foco industrial (Zona 3 — bodega)**
- Color: `#D4903A` (ámbar industrial)
- Temperatura: 2500K
- Comportamiento: Único foco colgante central. Sombras duras y angulares sobre las cajas. El ángulo muerto NE queda fuera de su radio directo — la maleta de Moni está en sombra intencionada.
- Intensidad: 1.5
- Sombras: Sí, máxima dureza (borde sin difusión).
- En Blender: Point Light alto (colgado a 2.8m), con bloqueador de luz en el costado NE para crear la sombra de narrativa sin inconsistencia física.

**L7 — Focos de trabajo (Zona 4 — pasillo)**
- Color: `#C88030` (ámbar industrial, ligeramente más frío que L6)
- Temperatura: 2600K
- Comportamiento: Tres focos en serie. Cada uno ilumina un círculo de ~1.2m de diámetro en el suelo. Los tramos entre focos están en oscuridad casi total. Los focos crean el ritmo narrativo del pasillo — luz, sombra, luz, sombra, escalera.
- Intensidad: 1.0 por unidad
- En Blender: Tres Point Lights equidistantes a lo largo del pasillo. Desactivar iluminación ambiental (ambient) en este espacio casi completamente — la oscuridad entre pools debe ser efectiva.

**L8 — Lámpara volcada (Zona 5 — oficina, escena del crimen)**
- Color: `#E8E4D8` (blanco frío — la única luz fría del juego)
- Temperatura: 4000K
- Comportamiento: La fuente de luz más inusual del juego. Está volcada — el haz apunta en diagonal ascendente hacia la pared noroeste en lugar del techo o la mesa. Ilumina el lado izquierdo de los personajes desde abajo y a un ángulo de ~35° del suelo. Las sombras van hacia arriba — el efecto es levemente inquietante porque invierte el eje natural de la iluminación humana.
- Intensidad: 1.8
- Sombras: Sí, alta resolución. Las sombras ascendentes son el efecto más importante de este espacio.
- En Blender: Spot Light caído en diagonal. Girar el modelo de la lámpara para que la posición física y la dirección de la luz sean coherentes — la lámpara debe estar volcada en la misma dirección que su haz.

**L9 — Foco cenital (Zona 6 — sala de interrogatorio)**
- Color: `#F0E8D0` (blanco cálido)
- Temperatura: 3200K
- Comportamiento: Un único foco en el techo, directamente sobre la mesa. Ilumina la mesa y los dos sujetos sentados desde arriba. El ángulo superior crea sombras descendentes en los personajes — ligeramente inquietante en low-poly porque los planos facetados crean sombras inusuales.
- Intensidad: 2.5 (la más alta del juego — esta sala no tiene secretos, tiene foco)
- Sombras: Sí, máxima resolución. Las sombras son la única decoración de esta sala.
- En Blender: Spot Light cenital, ángulo 40°, blend 0.05 (borde muy duro).

### Temperatura de color por zona (resumen)

| Zona | Temperatura dominante | Efecto emocional |
|------|-----------------------|-----------------|
| Vestíbulo | 2400K + 5500K (neón) | Bienvenida artificiosa, tensión verde en el umbral |
| Salón principal | 2700K (ámbar difuso) | Lujo cálido, opulencia de segunda categoría |
| Bodega | 2500K (industrial) | Utilidad, trabajo, clase de servicio |
| Pasillo | 2600K (pools) | Aislamiento, ritmo, nervios |
| Oficina | 4000K (fría) | Muerte, burocracia, vacío de poder |
| Interrogatorio | 3200K (cenital) | Juicio, sin evasión posible |

---

## 6.7 Descripción Detallada de Áreas

### Zona 1 — Vestíbulo

**Dimensiones:** ~5m × 7m, techo 3.5m

**Descripción arquitectónica:** Espacio de decompresión entre la lluvia exterior y el club. Las puertas dobles sur son de vidrio emplomado con patrón geométrico art deco (rombos, líneas en ángulo de 45°). El vidrio permite ver siluetas y lluvia al exterior pero no detalle. El marco de las puertas es latón `#C8A040`.

Al norte, el arco de paso (4m × 3m) enmarca una vista directa al escenario jazz del salón — el punto más luminoso del juego es visible desde la entrada. Esta vista es intencional: el escenario es el anzuelo visual que tira al jugador hacia el interior.

El guardarropa ocupa la pared oeste: mostrador de madera oscura `#2A1B0E`, ganchos de latón numerados en la pared detrás, espejo de cuerpo entero en la pared más al fondo del guardarropa. Los abrigos colgados son geometría simplificada (prisma trapezoidal, sin mangas individuales modeladas) — su función es contextual, no de detalle. El abrigo #14 lleva una etiqueta de latón visible.

El suelo de tiles hexagonales comienza en el vestíbulo y continúa hacia el salón sin interrupción — la misma gramática visual de suelo unifica ambos espacios en el registro de "espacio público del club".

**Estado de desgaste:** Moderado. Las juntas entre tiles tienen acumulación de suciedad visual (líneas más oscuras `#1A1208` entre los hexágonos). El panelado de madera tiene una marca de rozadura a la altura de la cadera en el extremo cerca del guardarropa — alguien pasa con abrigos regularmente.

---

### Zona 2 — Salón Principal / Barra

**Dimensiones:** ~18m × 14m, techo 4.5m

**Descripción arquitectónica:** El espacio más grande del juego y el más cargado visualmente. Tres pilastras en cada pared lateral articulan el salón en "naves" visuales. El techo lleva molduras en tres niveles descendentes que convergen sobre la pista de baile central, enfatizando ese espacio vacío como el centro visual del salón.

El escenario jazz al norte está elevado 0.4m — una diferencia mínima que crea una separación clara entre el espacio de actuación y el espacio social. El fondo del escenario tiene terciopelo oscuro `#0D2020` que absorbe la luz y hace que los músicos (siluetas low-poly estáticas) sean legibles como siluetas oscuras sobre un fondo más oscuro — la técnica correcta para este tipo de geometría.

La barra de caoba ocupa 7m de la pared oeste. El panelado detrás de la barra llega hasta el techo — las estanterías retroiluminadas (L3) son el elemento de más intensidad lumínica en la pared oeste. El suelo detrás de la barra es de madera `#2A1B0E`, diferente del tile del salón — marca visualmente el territorio de trabajo.

El reservado de Barry (NW) es una alcoba recesada 0.6m en la pared noroeste. El papel tapiz geométrico `#2E4A1E` de esta alcoba es único en el club — verde cazador con patrón de rombos. Esta diferencia del entorno general es un marcador de estatus: los reservados tienen personalización que el espacio común no tiene.

**Flujo visual desde el centro de la pista de baile:** Al girar 360°, el jugador ve en secuencia: escenario (luz más cálida y alta), pared este con mesas y Moni, pared sur con salida, barra oeste con Gerry, arco norte hacia vestíbulo con Spud. Todos los NPCs claves son visibles sin moverse. Este diseño es una regla de arte: **cada adición al salón debe respetar la línea de visión a los NPCs desde el centro de la pista.**

---

### Zona 3 — Almacén / Bodega

**Dimensiones:** ~9m × 7m

**Descripción arquitectónica:** Espacio industrial sin pretensiones. Las paredes son bloque de concreto pintado con pintura institucional verde-gris `#4A5040` que se está descascarando en las esquinas para revelar el gris desnudo `#4A4035` debajo. El techo es vigas de acero expuestas `#3A3530` con el foco industrial L6 colgando de una cadena. No hay molduras, no hay panelado.

La estantería piso-techo en la pared oeste es metal industriales soldado, color `#4A4538`, con tablones de madera como baldas. No es decorativa — es funcional hasta el extremo opuesto de los estantes del salón.

El espacio de cocina es visible a través de una media puerta batiente — la cocina no es accesible pero su interior es parcialmente legible: superficies de acero, una olla grande en el fogón, el tipo de detalle que establece que el club funciona, que hay una operación real detrás del glamour.

**Ángulo muerto NE:** La columna de cajas que crea el ángulo muerto debe medir entre 1.6m y 1.9m de altura. Debe ser lo suficientemente alta para ocultar la maleta completamente desde la puerta pero no tan alta que parezca una barricada deliberada. El objetivo visual es que parezca apilamiento casual de almacén — pero estructuralmente sirve para crear el espacio de ocultación.

---

### Zona 4 — Pasillo de Servicio

**Dimensiones:** ~12m × 2.2m, norte-sur, techo 2.8m

**Descripción arquitectónica:** El pasillo más estrecho del club. Las paredes son concreto desnudo `#4A4035`. El suelo es concreto con marcas de humedad en las juntas de las losas. El techo tiene la tubería de instalaciones visible (una sola línea de cobre corriendo norte-sur a lo largo del techo).

La ventana alta (1m × 0.4m) en la pared este está a 2.2m de altura — demasiado alta para mirar hacia afuera, solo sirve para dejar pasar una tira de luz del neón exterior. La única ventana en este pasillo. La tira de neón verde que proyecta en el suelo es el único lugar en el juego donde el neón toca el suelo — esto lo hace visualmente singular y lo marca como un espacio anómalo dentro de la gramática establecida.

La escalera al norte tiene pasamanos de tubería de acero soldada (sin ornamento), escalones de madera sin alfombrar con marcas de desgaste en el centro de cada escalón. El giro en el rellano a ~2m de altura corta la vista del destino — el jugador sube sin saber exactamente adónde va.

---

### Zona 5 — Oficina de Cornelius

**Dimensiones:** ~8m × 6m, piso 2

**Descripción arquitectónica:** La oficina de un hombre que quería que creyeran que era más importante de lo que era. El panelado de madera llega hasta el techo aquí — no como decoración del club sino como signo de privatización del espacio. Las paredes de club tienen panelado hasta 1.5m; la oficina de Corn tiene panelado completo. El exceso es el signo.

El escritorio mahogany ocupa la pared norte con orientación sur — Corn se sentaba mirando hacia la puerta, con el control del espacio. La caja fuerte en la pared este está al alcance de la mano desde el escritorio — un paso lateral, sin levantarse.

La puerta secundaria en la pared oeste es idéntica al panelado circundante excepto por el cerrojo de latón. Sin manija en el exterior — desde el corredor solo hay un ojo de cerradura. La invisibilidad de esta puerta es narrativamente importante: Barry la conocía porque conocía la oficina. Un visitante ocasional no habría sabido que existía.

La alfombra persa `#4A2A1E` ocupa el espacio central del despacho y llega hasta el escritorio. Sus bordes tienen ligeros ondulados por el uso — el borde noreste está ligeramente levantado, donde el encendedor F3 descansa semioculto.

---

### Zona 6 — Sala de Interrogatorio

**Dimensiones:** ~5m × 4m

**Descripción arquitectónica:** La sala más pequeña y más reciente del club. Las paredes no tienen el desgaste de las otras zonas — el pintura oscura `#1E1810` está relativamente limpia. El espejo unidireccional ocupa toda la pared sur (3m × 1.8m), enmarcado en acero negro. En este espacio hay solo dos superficies: la oscuridad de las paredes y la intensidad del foco.

La mesa es perfectamente rectangular, perfectamente centrada en el espacio, con las dos sillas exactamente opuestas. Esta simetría perfecta es la única geometría simétrica deliberada del juego. Contrasta con la asimetría de todos los otros espacios — el club fue diseñado con irregularidad, con la humanidad de lo construido orgánicamente. Esta sala fue diseñada para ser perfecta. Eso la hace inquietante.

---

## 6.8 Reglas de Geometría

### Low-Poly aplicado al entorno

El principio es **low-poly intencional, no low-poly por limitación**. La cantidad de polígonos en cada objeto es una decisión artística, no un accidente de pipeline.

### Clasificación de objetos por nivel de detalle

**Caras planas sin excepción (elementos de arquitectura base):**
- Paredes, suelos, techos: siempre quad plano, sin subdivisión.
- Marcos de puertas y ventanas: extrusiones ortogonales, sin chamfer.
- Molduras de techo: perfil de escalón con 2–3 vértices máximo en el perfil.
- Panelado de madera: caras planas con ranura modelada como canal hundido de 3mm (2 polígonos en sección transversal).

**Low-poly con facetas visibles (mobiliario y objetos medios):**
La curvatura se aproxima con ángulos facetados. La regla es que la ilusión de curva debe lograrse con el mínimo de caras que la haga reconocible.

| Objeto | Facetas para la curvatura | Poly count orientativo |
|--------|--------------------------|------------------------|
| Respaldo de silla circular | 8 lados | 60–80 polys total |
| Botella de barra | 6 lados en sección | 40–60 polys |
| Copa de cristal | 8 lados en sección | 30–50 polys |
| Sombrero/fedora (Gerry) | 12 lados en ala | 80–100 polys |
| Taburete de barra | 8 lados en asiento | 50–70 polys |
| Lámpara de mesa (pantalla) | 10 lados | 50 polys |
| Piano de cola | 0 curvas — todo angulado | 150–200 polys |

**Curvatura permitida (excepciones narrativas):**
La curvatura suave (shade smooth, más de 16 lados) se permite únicamente en:
- **Cuerpos de personajes-fruta**: Los personajes son frutas. Su redondez orgánica es su identidad. Esta es la única zona del espacio donde lo orgánico existe.
- **Botellas de vidrio (objetos clave de escena)**: Las botellas que son props narrativos (la copa de Barry, la botella de apertura de la barra) pueden tener más facetas que las botellas de fondo.
- **Huevos/esferas de luminaria**: Las bombillas de los focos pueden ser esféricas.

**Curvatura explícitamente prohibida en:**
- Toda arquitectura (paredes, arcos, columnas).
- Mobiliario de fondo (las sillas del crowd, las mesas del fondo).
- Suelos y techos.

### Poly count orientativo por categoría de entorno

| Categoría | Polys máximos | Notas |
|-----------|--------------|-------|
| Prop pequeño (cenicero, vaso, cenicero) | 50–80 | Sin subdivisión |
| Prop mediano (silla, lámpara) | 80–180 | Con facetas a 8–12 lados |
| Prop grande (escritorio, piano, barra) | 200–600 | Piezas compuestas de subobjectos simples |
| Elemento arquitectónico (pilastra, arco) | 30–80 | Extrusiones simples |
| Escalera completa | 400–600 | Cada escalón es 2 caras |
| Siluetas de crowd (MultiMesh) | 40–60 por unidad | Ningún crowd individual supera 60 polys |

### Reglas de escala física orientativas

Todas las medidas son aproximaciones para establecer coherencia visual. No son dimensiones de arquitectura real — son referencias para que el entorno se sienta a escala con personajes de ~1.6m de altura:

| Elemento | Altura / Medida |
|----------|-----------------|
| Altura de personaje medio (NPC) | ~1.6m |
| Mesa de bar / barra | 1.1m de altura |
| Taburete de barra | 0.75m de asiento |
| Mesa de gala | 0.75m de altura |
| Arco de paso vestíbulo→salón | 4m × 3m |
| Altura panel de madera en pared | 1.5m desde suelo |
| Escalón de la escalera | 0.18m de contrahuella |

---

## 6.9 Prompts de IA para Blender

Estos prompts están diseñados para guiar herramientas de generación 3D con IA (Blender Geometry Nodes, plugins de generación procedural, o descripciones para IA de referencia visual). Cada prompt va acompañado de instrucciones técnicas para el artista que lo ejecuta en Blender.

---

### Prompt A1 — Vestíbulo de El Agave y La Luna

**Uso:** Generación del espacio completo del vestíbulo.

> A 1950s noir club entrance foyer, 5 meters wide by 7 meters deep, low-poly angular aesthetic. Art Deco architecture in a state of dignified decay. Double glass doors on the south wall with a geometric lead-glass pattern — diamond shapes, straight lines at 45-degree angles, heavy brass frames in aged gold (#C8A040). Through the glass, the suggestion of rain and a faint green neon reflection from outside. The north wall has a wide trapezoidal arch, 4 meters wide, framed in dark mahogany paneling (#2A1B0E), opening to a view of a jazz stage in the background — the brightest point visible from this entrance. West wall: a coat check counter in dark wood, a row of brass-numbered coat hooks on the wall behind, a full-length mirror. Floor: hexagonal tiles alternating warm ivory (#E8DFC8) and warm black (#1E1810). Pressed tin ceiling with geometric embossed pattern (#7A6040). An asymmetric brass chandelier hanging slightly off-center toward the north, warm amber light (2400K). The space feels like an anteroom to ambition — clean enough to impress, worn enough to be honest. Style references: Return of the Obra Dinn meets 1950s American noir, angular faceted geometry, no smooth curves on architecture.

**Instrucciones de pipeline (Blender):**
- Flat shading en toda la geometría arquitectónica. Desactivar Auto Smooth.
- Tiles hexagonales modelados como geometría plana separada del suelo base — no usar materiales para el patrón.
- Los abrigos del perchero son prismas trapezoidales simples de ~1.4m de altura, no requieren mangas.
- El candelabro debe tener emisión (Emission 0.4) además del Point Light asociado.
- La lluvia exterior se logra con un shader de partículas en el plano del vidrio — no modelar lluvia individual.

---

### Prompt A2 — Salón Principal / Pista de Baile

**Uso:** Generación del espacio central del club.

> A 1950s jazz club main hall, 18 meters wide by 14 meters deep, ceiling height 4.5 meters. Low-poly angular aesthetic, Art Deco of the decadent mid-century kind. The north wall features an elevated jazz stage (raised 0.4 meters) with dark teal-black velvet backdrop (#0D2020) and a single warm white spot light from above. West wall: a 7-meter mahogany bar counter (#2A1B0E) with backlit amber shelving holding bottles. Round tables and low chairs fill the east half of the room — the central 8x8 meter dance floor is completely clear. Decorative flat pilasters articulate the side walls. Three-tier recessed ceiling molding descends toward the center. The dominant light is warm amber (2700K), with a faint green neon tint (#5A7A2E) on the vertical surfaces nearest the entrance arch — never touching the floor in this room. Northwest corner: a private booth recessed 0.6 meters into the wall, with dark forest-green geometric wallpaper (#2E4A1E), a bourbon glass half-full on the table. Color palette: walls in dark ochre (#3A2A1A), floor tiles ivory and warm black, mahogany paneling on the lower 1.5 meters of walls. Style: Disco Elysium color authority, Night in the Woods flat geometry, 1950s American noir atmosphere, no organic curves on architecture.

**Instrucciones de pipeline (Blender):**
- Las siluetas de crowd en mesas de fondo deben ser humanoides simplificados (40–60 polys) diseñados para uso con MultiMeshInstance3D — modelar una única instancia exportable con ~5 variaciones de escala.
- El papel tapiz geométrico `#2E4A1E` del reservado de Barry es un material diferente — crear como material separado con patrón de rombos en la geometría (canal hundido de 2mm), no como textura.
- La estantería retroiluminada de la barra requiere una Area Light plana detrás de los modelos de botellas — los modelos actúan como oclusores.
- El escenario jazz es la zona de mayor contraste del espacio — el foco L5 (Spot, 2.0 intensidad, borde duro) debe ser visible y dominante desde el centro de la pista.

---

### Prompt A3 — Bodega / Almacén

**Uso:** Generación del almacén trasero del club.

> A 1950s nightclub storage room, 9 meters wide by 7 meters deep, industrial and undecorated. Raw concrete block walls with peeling institutional paint in desaturated gray-green (#4A5040), revealing raw concrete underneath at the corners. Exposed steel ceiling beams (#3A3530). A single incandescent industrial pendant light hanging from a chain in the center (warm amber #D4903A, 2500K, hard shadows). West wall: floor-to-ceiling metal utility shelving in aged steel (#4A4538) with wooden plank shelves. Stacks of wooden crates in the east area (dark brown tones #4A3020 to #6B4423, stacked in organized rows of varying heights). Burlap sacks of flour or sugar in the northeast corner — stacked to approximately 1.8 meters high, creating a visual blind spot from the entrance. A folding chair near the east service door, positioned facing outward. The east wall has a metal service door, slightly ajar, showing a strip of the darker hallway beyond. The floor is raw concrete with moisture stains at the joints. No decorative elements — this is purely functional space, the skeleton behind the glamour. Style: angular low-poly geometry, all flat-shaded, industrial wear visible through geometry variation not texture.

**Instrucciones de pipeline (Blender):**
- La columna de sacos NE (1.6m–1.9m de altura) debe bloquear la línea de visión hacia el ángulo muerto. Verificar con una cámara de primera persona desde la puerta de entrada que la maleta de Moni (un prop separado colocado detrás de los sacos) no sea visible.
- La puerta trasera metálica entreabierta: la posición de abertura debe ser ~15–20°, suficiente para que la oscuridad del pasillo sea visible pero no suficiente para revelar el pasillo.
- Las cajas de madera deben ser variaciones de 2–3 modelos base con escala diferente y textura de color diferente dentro del rango `#4A3020`–`#6B4423`.

---

### Prompt A4 — Pasillo de Servicio

**Uso:** Generación del pasillo trasero y su escalera.

> A narrow service corridor in a 1950s nightclub, 12 meters long by 2.2 meters wide, ceiling height 2.8 meters, running north-south. Raw concrete walls (#4A4035) and concrete floor with visible lozenge-shaped lozenge-stained joints. A single copper pipe running the length of the ceiling. Three individual work pendant lights hanging from the ceiling at regular intervals — each casting a circle of warm amber light (2600K, #C88030) approximately 1.2 meters in diameter on the floor, with dark unlit stretches between them. The rhythm is: light, dark, light, dark, light, stairs. The east wall has one small high window (1 meter wide, 0.4 meters tall) at 2.2 meters height — through it, a strip of green neon light (#5A7A2E) from outside projects down to the floor below it (the only place in the game where the green neon touches the floor). At the far north end: a wooden staircase — plain unvarnished wood steps with visible wear marks at the center of each step, welded steel pipe handrail painted black, a landing turn at 2 meters height that cuts the view of the destination. The space is constriction and focus, the spine of the crime. Style: extreme low-poly, flat-shaded concrete, industrial minimalism, angular shadows.

**Instrucciones de pipeline (Blender):**
- Los tres focos L7 deben desactivar iluminación ambiental entre ellos — usar shadow blockers laterales o configurar el falloff muy agresivo para que la oscuridad entre focos sea real, no gris.
- La huella de barro de Barry (un mesh de suela de zapato plano, ~28cm, color `#3A2820`) se coloca entre el 2° y 3° pool de luz — parcialmente iluminada para que sea detectable pero no obvia.
- La escalera termina en un giro que no muestra el destino — el modelo debe ser diseñado para que la cámara de primera persona no pueda ver más allá del rellano desde la base de la escalera.

---

### Prompt A5 — Oficina de Cornelius (Escena del Crimen)

**Uso:** Generación de la oficina del piso 2 y la escena del crimen.

> A private office on the second floor of a 1950s American club, 8 meters wide by 6 meters deep. Dark mahogany wood paneling covers the walls from floor to ceiling (#1E1A14) — unlike the rest of the club where paneling only covers the lower 1.5 meters, here the ambition to impress is total. North wall: a heavy mahogany desk (#1A1208) facing south, a reading lamp lying toppled on its side — the cord stretched taut to the left of the desk, casting the only light in the room at a harsh upward diagonal (cold white, 4000K, #E8E4D8), creating shadows that go upward rather than downward. East wall: a steel floor safe, door fully open, interior visible with papers partially pulled out and disordered. A Persian rug in dark desaturated burgundy (#4A2A1E) covers the center floor, with one corner slightly curled upward near the desk. West wall: a secondary door flush with the wood paneling, almost invisible except for a small brass latch — no handle on the outside. A lateral window on the west wall is open, its latch showing "locked from inside." Two metal filing cabinets on the north wall, one drawer slightly ajar. A framed newspaper photograph on the east wall. The entire room communicates bureaucratic power — the power of a man who held paper over people. Cold, airless, abandoned. Style: low-poly angular geometry, flat-shaded dark mahogany, single cold dramatic light source, crime scene stillness.

**Instrucciones de pipeline (Blender):**
- La lámpara volcada L8 es el elemento visual más importante de la escena. El modelo de la lámpara debe estar caído en un ángulo de ~35° respecto al suelo, con el cable tenso hacia la izquierda. El Spot Light asociado debe estar exactamente en la posición del filamento del modelo, orientado en la dirección del reflector.
- La alfombra persa: borde levantado en la esquina noreste modelado como geometría (un loop edge elevado 2cm en la esquina NE), no como detalle de textura. El prop del encendedor F3 descansa en ese borde elevado.
- La puerta secundaria empotrada en el panelado debe usar el mismo material de madera que las paredes con una junta de 5mm en el perímetro como único indicador. El cerrojo de latón es el único elemento diferenciador.

---

### Prompt A6 — Sala de Interrogatorio

**Uso:** Generación de la sala de interrogatorio.

> An interrogation room in a 1950s American precinct-style space, 5 meters wide by 4 meters deep. Plain dark walls (#1E1810 to #2A2020) without decoration, wear, or character — unlike the rest of the building, these walls feel constructed rather than lived in. A rectangular table perfectly centered in the space, two identical chairs positioned precisely opposite each other — the only perfectly symmetrical geometry in the entire game. Directly above the table, a single ceiling spot light (warm white, 3200K, hard edge, #F0E8D0, high intensity) is the only light source. The south wall has a one-way mirror — full wall width (3 meters), steel black frame, the reflective surface showing only the dim shape of the room itself. On the table: a writing pad with faint pressure indentations visible under oblique light, two empty water glasses, one clean ashtray. Nothing else. The room is accountability made physical — no distractions, no comfort, no escape from the light. Style: extreme austerity, low-poly geometry, the only symmetric space in the game, the one-way mirror as the only decorative element.

**Instrucciones de pipeline (Blender):**
- El espejo unidireccional usa un material con Roughness 0.2 (el más reflectante del juego) y Metallic 0.3. No es un espejo perfecto — la reflexión es apagada, como vidrio oscurecido. No requiere shader de reflexión complejo — la reflexión difusa del motor es suficiente.
- Las indentaciones del bloc de notas son geometría leve (depresión de 0.5mm de profundidad en la superficie del bloc) que solo son visibles bajo luz oblicua — colocar el bloc ligeramente fuera del eje del foco cenital para que la luz L9 los revele en ángulo.
- Las paredes de esta sala deben tener el contraste ACC-04 verificado: mínimo 4.5:1 entre el color de pared y los props interactivos sobre la mesa. El bloc de notas `#E8E0C8` sobre la mesa `#2A2218` debe superar esta ratio.

---

---

## 7. UI/HUD Visual Direction

### 7.0 Principio Rector

En un juego de VR en primera persona, **la pantalla no existe**. No hay HUD flotante pegado a la cámara. Toda la UI es diegética o espacial — existe dentro del mundo del juego, no encima de él. El jugador de Limonchero 3D es un detective noir: no mira menús, *investiga*.

La regla de oro: **si un detective de los 50 no lo usaría, el jugador no lo ve**.

---

### 7.1 Filosofía de UI en VR Noir

#### Tres capas de interfaz

| Capa | Tipo | Ejemplos | Anclaje |
|---|---|---|---|
| **Diegética** | Existe en el mundo | Libreta de notas, fotografías de pistas, reloj de pared | World-space, objeto 3D |
| **Espacial** | Flota en el mundo, no en la cámara | Subtítulos durante diálogo, indicadores de interacción | World-space, billboard |
| **Sistema** | Menús fuera del mundo | Pausa, configuración, créditos | Screen-space, solo cuando necesario |

**Regla**: los elementos de Sistema solo aparecen cuando el juego está pausado. Durante gameplay, todo es Diegético o Espacial.

---

### 7.2 Elementos Diegéticos

#### 7.2.1 La Libreta de Notas (inventory principal)

El jugador lleva una libreta física en el bolsillo de la gabardina. Al sacarla, se convierte en el hub de información.

- **Material visual**: cuero marrón oscuro desgastado, `#3D2510`. Cantos con desgaste geométrico — sin suavizado
- **Páginas internas**: papel amarillento, `#F5ECC8`. Texto en fuente monospace tipo máquina de escribir
- **Pistas añadidas**: aparecen como fotografías en blanco y negro pegadas con cinta adhesiva, o notas manuscritas con tinta azul oscuro
- **No hay iconos de color**: todo en escala de grises + sepia, excepto marcadores de importancia en rojo tinta `#8B1A1A`
- **Layout de página**: columna izquierda para hechos confirmados, columna derecha para sospechas — separados por una línea vertical de tinta

#### 7.2.2 Fotografías de Pistas

Las pistas físicas se representan como fotografías en blanco y negro que el jugador puede sostener y examinar.

- **Borde**: blanco crudo `#F0EDE0`, 4–6mm de grosor geométrico
- **Imagen**: desaturada al 100%, con ligero viñetado en las esquinas
- **Reverso**: texto de máquina de escribir con código de evidencia — formato `EV-[número]-[inicial de escena]`
- **Desgaste**: esquinas ligeramente dobladas (deformación geométrica sutil, no textura)

#### 7.2.3 Reloj de Pared (indicador de tiempo narrativo)

En la escena del club, un reloj de pared art deco indica la presión temporal del caso.

- El tiempo no es real — es narrativo. El reloj avanza en saltos cuando el jugador completa objetivos
- **Estilo visual**: esfera crema, números romanos, agujas negras geométricas
- Sin números digitales, sin barra de progreso

---

### 7.3 Elementos Espaciales

#### 7.3.1 Indicadores de Interacción

Cuando el jugador apunta a un objeto interactuable, aparece un indicador mínimo.

- **Forma**: punto de luz `#E8D5A3` (blanco cálido), 8px equivalente en world-space
- **Sin texto por defecto** — el objeto debe ser legible por sí mismo
- **Con texto solo si es ambiguo**: fuente monospace, tamaño mínimo legible en Quest 2 (≥18pt en world-space equivalente), color `#E8D5A3`
- **Distancia de aparición**: solo visible a ≤1.5 metros del objeto
- **Sin animación pulsante**: el indicador es estático. El movimiento en VR causa fatiga visual

#### 7.3.2 Subtítulos de Diálogo

Durante interrogatorio, los diálogos del NPC tienen subtítulos opcionales (accesibilidad).

- **Posición**: billboard anclado a 20cm por encima de la cabeza del NPC, no en la pantalla
- **Fondo**: panel negro semi-transparente `#000000` a 70% opacidad, bordes sin redondear
- **Texto**: blanco `#FFFFFF`, fuente monospace, máximo 2 líneas, máximo 40 caracteres por línea
- **Nombre del hablante**: línea superior en color de identidad del personaje (ver tabla abajo), mayúsculas, tamaño ligeramente menor
- **Desaparece**: al terminar la frase de audio, fade out en 0.3s — sin esperar input

#### Colores de identidad para subtítulos

| Personaje | Color de nombre | Hex |
|---|---|---|
| Gajito | Verde lima | `#8BC34A` |
| Commissioner Spud | Marrón tierra | `#6B4423` |
| Moni Graná Fert | Granate | `#8B2332` |
| Gerry Broccolini | Verde oscuro | `#4A6B30` |
| Lola Persimmon | Naranja-marrón | `#C4703A` |
| Barry Peel | Amarillo frío | `#D4C840` |

#### 7.3.3 Indicador de Voz Activa (STT)

Cuando el micrófono está escuchando la voz del jugador, aparece un indicador mínimo.

- **Posición**: esquina inferior izquierda del campo visual, anclado a head-space (no world-space)
- **Forma**: tres líneas horizontales de audio equalizadas — animación de onda cuando detecta voz
- **Color activo**: `#E8D5A3` (blanco cálido). **Color inactivo**: `#4A4035` (casi invisible en escena oscura)
- **Tamaño**: 32×16px equivalente — mínimo perceptible, no más
- **Sin texto "escuchando..."** — el ícono es suficiente

---

### 7.4 Elementos de Sistema (Menús)

Solo accesibles desde pausa. El mundo se congela y desatura al 20% cuando están activos.

#### 7.4.1 Paleta de Sistema

| Elemento | Color | Uso |
|---|---|---|
| Fondo de panel | `#0D0D0D` | Negro casi puro — el mundo desaturado es el "fondo" |
| Borde de panel | `#3D3020` | Marrón oscuro, 1px geométrico |
| Texto primario | `#E8D5A3` | Blanco cálido — nunca blanco puro en noir |
| Texto secundario | `#7A6A50` | Para descripciones, labels inactivos |
| Acción confirmada | `#8B1A1A` | Rojo tinta — solo para confirmaciones destructivas |
| Acción principal | `#E8D5A3` | Mismo que texto primario — sin botones de color |

#### 7.4.2 Tipografía de Sistema

- **Fuente**: monospace serif (tipo máquina de escribir). Referencia: *Special Elite* o equivalente con licencia libre
- **Tamaño mínimo en Quest 2**: 16pt para texto de cuerpo, 24pt para títulos — nunca menor
- **Sin bold pesado**: el noir es delgado. Usar peso regular, itálica para énfasis
- **Sin iconos de color**: los íconos son outline geométrico en `#E8D5A3`

#### 7.4.3 Layout del Menú de Pausa

Panel único centrado, sin tabs ni navegación profunda. Ancho máximo: 60% del FOV.

```
┌─────────────────────────────┐
│  LIMONCHERO 3D              │
│  ─────────────────          │
│  Continuar                  │
│  Revisar notas              │
│  Configuración              │
│  ─────────────────          │
│  Salir al menú principal    │
└─────────────────────────────┘
```

Sin animaciones de entrada/salida elaboradas — fade simple a 0.2s.

---

### 7.5 Lo que Está Prohibido en la UI

- **Barras de vida, stamina o medidores de estado**: no es un juego de acción
- **Minimapa**: la escena es un único club — el jugador lo navega físicamente
- **Pop-ups de logros durante gameplay**: interrumpen la inmersión noir
- **Colores de alta saturación fuera del sistema** (excepto rojo tinta `#8B1A1A` para confirmaciones destructivas)
- **Fuentes sans-serif redondeadas**: incompatibles con la estética noir-frutícola
- **Animaciones de UI que duren más de 0.3s**: en VR el movimiento de UI causa incomodidad
- **Texto en pantalla completa que no sea diegético**: el noir es mostrar, no explicar

---

## 8. Asset Standards

## 8.0 Principio Rector

Los assets de Limonchero 3D se producen en Blender con apoyo de herramientas de IA generativa y se importan a Godot 4 via glTF 2.0. Cada asset que entra al proyecto debe pasar por este documento antes de ser referenciado en una escena. Un asset que no cumple los estándares aquí definidos no entra al juego — sin excepciones. La IA generativa produce puntos de partida, no assets finales. El artista es responsable de la calidad técnica.

---

## 8.1 Formatos de Exportación

### 8.1.1 Formato recomendado: glTF 2.0 (.glb)

El formato oficial de Godot 4 es **glTF 2.0**, exportado como archivo binario `.glb` (empaqueta mesh + texturas + materiales en un solo archivo). Es el único formato que Godot 4 importa con soporte completo de materiales PBR, esqueletos, y blend shapes.

**No usar FBX.** Godot 4 importa FBX pero requiere el conversor `FBX2glTF` y pierde datos de materiales frecuentemente — genera trabajo extra sin beneficio. No usar `.obj` — no soporta materiales PBR ni esqueletos.

### 8.1.2 Configuración de exportación en Blender

Ruta en Blender: `File → Export → glTF 2.0 (.glb/.gltf)`

**Configuración requerida:**

| Parámetro | Valor | Razón |
|---|---|---|
| Format | glTF Binary (.glb) | Todo en un archivo, no una carpeta |
| Include — Selected Objects | Activado | Exportar solo el asset activo, no la escena entera |
| Include — Custom Properties | Activado | Permite pasar metadatos a Godot si se necesita |
| Transform — +Y Up | Activado | Godot 4 usa Y-up; sin esto el modelo aparece rotado 90° |
| Geometry — Apply Modifiers | Activado | Aplana los modifiers antes de exportar |
| Geometry — UVs | Activado | Indispensable |
| Geometry — Normals | Activado | Indispensable |
| Geometry — Tangents | Solo si usa normal map | Sin normal map, desactivar para ahorrar datos |
| Geometry — Loose Edges | Desactivado | No exportar geometría de debug |
| Geometry — Loose Points | Desactivado | Idem |
| Animation — Export | Solo si el asset tiene animación propia | Props estáticos: desactivado |
| Materials — Export | PBR Extensions | Formato correcto para Godot 4 |

**Lo que NO incluir en el export:**
- Rig de posado provisional (aplicar la pose base antes de exportar, o exportar sin rig si es prop estático)
- Luces y cámaras de la escena de Blender
- Objetos de referencia o helpers de escena
- Colisión mesh sin sufijo `_col` (ver sección 8.6)

### 8.1.3 Verificación post-importación en Godot 4

Después de importar el `.glb`, verificar en el Inspector de Godot:
1. El modelo aparece orientado correctamente (Z hacia adelante, Y hacia arriba)
2. Los materiales se asignaron como `StandardMaterial3D` o `BaseMaterial3D`
3. No hay mensajes de advertencia de importación en el panel Output
4. La escala en el nodo raíz es `(1, 1, 1)` — si Godot muestra otra escala, el problema está en Blender (ver 8.5)

---

## 8.2 Convenciones de Nomenclatura de Archivos

### 8.2.1 Estructura general

```
[categoría]_[nombre_objeto]_[variante]_[lod].[ext]
```

Todas las palabras en `snake_case`. Sin espacios, sin acentos, sin caracteres especiales. Sin mayúsculas (Godot en Linux es case-sensitive).

### 8.2.2 Categorías

| Prefijo | Uso |
|---|---|
| `prop_` | Props interactuables o decorativos del entorno |
| `struct_` | Geometría de estructura (paredes, suelos, techos, arcos) |
| `char_` | Personajes (ver convención completa en Sección 5.8) |
| `env_` | Elementos de entorno grande (barra completa, escenario) |
| `fx_` | Meshes usados en efectos visuales |
| `col_` | Meshes de colisión simplificada (solo en Godot, no assets visuales) |

### 8.2.3 Ejemplos concretos para los assets del club

**Meshes / archivos .glb:**
```
prop_copa_bourbon_lod0.glb
prop_copa_bourbon_lod1.glb
prop_cenicero_base_lod0.glb
prop_encendedor_oro_lod0.glb          ← pista R3
prop_maletin_moni_lod0.glb            ← pista D1
prop_silla_reservado_lod0.glb
prop_silla_reservado_lod1.glb
prop_mesa_reservado_lod0.glb
prop_lampara_escritorio_lod0.glb
prop_lampara_escritorio_lod1.glb
env_barra_completa_lod0.glb
env_escenario_club_lod0.glb
struct_pared_salon_a.glb
struct_puerta_oficina.glb
struct_ventana_oficina.glb
```

**Texturas:**
```
prop_copa_bourbon_albedo.png
prop_copa_bourbon_roughness.png
prop_copa_bourbon_emission.png         ← solo si emite luz
env_barra_albedo.png
env_barra_roughness.png
struct_paredes_salon_albedo.png
atlas_props_madera_albedo.png
atlas_props_madera_roughness.png
```

**Materiales (en Godot, archivos .tres):**
```
mat_madera_oscura.tres
mat_metal_laton.tres
mat_tela_reservado.tres
mat_vidrio_copa.tres
```

### 8.2.4 Regla de variantes

Si un objeto tiene variantes visuales (roto, manchado, abierto), se expresan en el campo `[variante]`:
```
prop_copa_bourbon_vacia_lod0.glb
prop_copa_bourbon_caida_lod0.glb
struct_ventana_oficina_abierta.glb
struct_ventana_oficina_cerrada.glb
```

### 8.2.5 Lo que está prohibido en nombres de archivo

- Espacios: `escenario prueba 2.blend` — incorrecto
- Acentos o ñ: `lámpara.glb`, `oficina_córnelious.glb` — incorrecto
- Nombres genéricos: `mesh_01.glb`, `objeto_nuevo.glb` — incorrecto
- Nombres de la herramienta IA: `generated_asset_v3_final_final.glb` — incorrecto

> **Nota de acción:** Los archivos actuales `assets/models/escenario prueba.blend` y `assets/models/escenario prueba 2.blend` violan esta regla. Renombrarlos a `env_club_prototipo_v1.blend` y `env_club_prototipo_v2.blend` antes de referenciarlos en escenas de Godot.

---

## 8.3 Tiers de Resolución de Texturas

### 8.3.1 Tabla de tiers por categoría

| Categoría | Textura LOD0 | Textura LOD1 | Notas |
|---|---|---|---|
| Props interactuables de primer plano (copa, encendedor, llave, documento) | 512×512 | 256×256 o atlas | El jugador los inspecciona de cerca |
| Props decorativos de primer plano (cenicero, silla en foreground) | 512×512 | Atlas compartido | |
| Props de relleno / fondo (sillas de fondo, botellas en estante) | 256×256 en atlas | 128×128 en atlas | Nunca en pantalla solos |
| Estructuras (paredes, suelo, techo) | 1024×1024 en atlas | Misma textura con mip | Cubren mucha área visible |
| Elementos de entorno grandes (barra completa, escenario) | 1024×1024 | 512×512 | Siempre en cámara |
| Personajes LOD0 | 1024×1024 por atlas | — | Ver Sección 5.7.4 |
| Personajes LOD1 | 512×512 en atlas | — | Ver Sección 5.7.4 |

### 8.3.2 Formatos de compresión en Godot 4

| Uso | Compresión recomendada en Godot |
|---|---|
| Albedo (color) con opacidad | VRAM Compressed (S3TC/BPTC en PC) |
| Roughness / Metallic | VRAM Compressed |
| Emission | VRAM Compressed |
| Normal map | VRAM Compressed — activar "Normal Map" en la importación |
| Máscaras (B&W, como la máscara de manchas de Barry) | Lossless — la precisión importa |

Configurar en Godot: seleccionar el archivo `.png` en el FileSystem → Inspector → Import tab. Activar **Mipmaps: On** siempre para texturas de entorno.

---

## 8.4 Presupuesto de Polígonos por Categoría

### 8.4.1 Tabla de presupuestos (en triángulos)

| Categoría | LOD0 (máx. tris) | LOD1 | LOD2 | Ejemplos |
|---|---|---|---|---|
| Prop pequeño — no interactuable | 100–300 | 50–100 | Atlas sprite | Cenicero de fondo, vela, copa de relleno |
| Prop pequeño — interactuable / pista | 300–800 | 150–300 | No aplica | Copa de bourbon (R5), encendedor (R3), llave maestra (R2) |
| Prop mediano — no interactuable | 400–800 | 150–300 | 50–100 | Silla de fondo, banqueta de barra |
| Prop mediano — interactuable | 800–1.500 | 300–500 | 100–200 | Silla del interrogatorio, mesa del reservado |
| Prop grande / elemento de entorno | 1.500–3.000 | 800–1.200 | 200–400 | Barra del club, piano del escenario |
| Estructura de sala (por segmento) | 500–1.200 | Misma malla | — | Sección de pared, arco, tramo de suelo |
| Escenario completo (suma total) | < 80.000 | — | — | Todas las zonas del club en escena |

### 8.4.2 Reducción de assets de IA generativa

La IA generativa produce meshes densos (decenas de miles de triángulos). El flujo de reducción en Blender:

1. Seleccionar el objeto → agregar modifier **Decimate** en modo **Collapse**
2. Ajustar ratio hasta llegar al budget objetivo
3. Verificar que la silueta no se deforme visiblemente
4. Si se deforma: usar **Remesh** (modo Voxel) primero para limpiar la topología, luego Decimate
5. Aplicar el modifier: `Ctrl+A → Apply`
6. Revisar manualmente aristas de silueta importantes

Para props low-poly estilo Limonchero, prioridad: silueta > superficie interior.

---

## 8.5 Configuración de Materiales

### 8.5.1 Enfoque: Stylized PBR reducido

No PBR fotorrealista completo. No flat sin ninguna respuesta de luz. El enfoque es **Stylized PBR reducido**: usar el pipeline PBR de Godot 4 con un subconjunto limitado de mapas, eligiendo valores que refuerzan la estética low-poly facetada.

**Regla general: las facetas deben ser visibles.** Los materiales no deben disimular el low-poly — deben celebrarlo.

### 8.5.2 Qué mapas usar y no usar

| Mapa de textura | ¿Usar? | Justificación |
|---|---|---|
| Albedo (BaseColor) | Siempre | Define el color plano de las facetas |
| Normal Map | No para props generales | Un normal map suaviza las facetas — va en contra de la estética. Solo si la micro-textura orgánica es parte de la lectura. |
| Roughness | Sí, pero flat o con variación mínima | Un valor uniforme es suficiente. Evitar roughness maps complejos. |
| Metallic | Solo en props metálicos reales | Encendedor de oro (R3), latones de la barra, picaporte. |
| Emission | Solo para fuentes de luz diegéticas | Neón del letrero del club, lámpara de escritorio encendida. |
| Ambient Occlusion | Opcional, baked en albedo | Si el asset de IA tiene AO baked en el albedo, dejarlo. |
| Height / Displacement | No | Innecesario y costoso para este estilo. |
| Subsurface Scattering | No | No requerido en low-poly; costoso en Forward+. |

### 8.5.3 Reglas de materiales en Blender para exportar a Godot 4

**Regla 1 — Usar solo el Principled BSDF.** No usar shaders procedurales (Noise, Wave, etc.) — no se exportan a glTF.

**Regla 2 — Mapeo de nodos a parámetros glTF:**

| Socket en Principled BSDF | Exporta como | Nota |
|---|---|---|
| Base Color (texture) | Albedo map | Usar textura PNG, no procedural |
| Base Color (valor) | Color uniforme | Válido para props sin textura |
| Roughness (valor) | Roughness uniform | |
| Metallic (valor) | Metallic uniform | 0.0 orgánicos, 0.8–1.0 metales |
| Emission Color + Strength | Emission map + factor | Conectar a Emission socket |
| Alpha (transparency) | Alpha clip o blend | Activar `Blend Mode: Alpha Blend` para vidrio translúcido |
| Normal Map node | Normal map | Nodo "Normal Map", no "Bump" |

**Regla 3 — Un material por mesh, máximo.** Si un prop de IA tiene 8 materiales, consolidar en uno antes de exportar.

**Regla 4 — Nombres de material en Blender = nombres en Godot.** Usar la misma convención de nomenclatura. Ejemplos: `mat_madera_oscura`, `mat_metal_laton`, `mat_tela_granate`.

### 8.5.4 Paleta de valores de roughness/metallic para el club

| Material | Roughness | Metallic | Notas |
|---|---|---|---|
| Madera de barra / muebles | 0.75 | 0.0 | Madera lacada años 50 |
| Tela (sillas, reservados) | 0.90 | 0.0 | Sin brillo |
| Metal latón (accesorios barra) | 0.40 | 0.85 | Brillo cálido |
| Metal plateado (cubiertos, marcos) | 0.35 | 0.90 | |
| Vidrio (copas) | 0.05 | 0.0 | Alto brillo, alpha blend |
| Papel / documentos | 0.95 | 0.0 | Sin brillo |
| Piel de personajes | 0.80 | 0.0 | Mate — ver Sección 5 |
| Neón iluminado | 0.30 | 0.0 + emission | Emisión activa |

---

## 8.6 Reglas de Pivote y Origen

### 8.6.1 Regla general

**Regla estándar: el origin va en la base del objeto, centrado en X y Z.**

Con esta regla, al colocar el objeto en Godot en posición `(0, 0, 0)`, el objeto descansará sobre el plano del suelo sin hundirse ni flotar.

### 8.6.2 Reglas específicas por tipo de objeto

| Tipo de objeto | Posición del origin |
|---|---|
| Props que descansan sobre superficie (silla, mesa, copa) | Base inferior, centro XZ del bounding box |
| Props colgantes (lámpara de techo, cuadro en pared) | Punto de anclaje superior |
| Puertas y ventanas | Borde del eje de rotación (bisagra) |
| Props de pared (interruptor, espejo) | Punto de contacto con la pared |
| Estructuras de sala (sección de pared) | Esquina inferior izquierda o centro base |
| Props de suelo irregulares (alfombra) | Centro geométrico en Y=0 |

### 8.6.3 Cómo aplicar el origin correctamente en Blender

Para una silla:
1. `Object → Set Origin → Origin to Geometry` — punto de partida
2. Mover el 3D cursor al punto correcto: `Shift+S → Cursor to World Origin`
3. Ajustar manualmente al fondo del objeto
4. `Object → Set Origin → Origin to 3D Cursor`
5. Aplicar: `Ctrl+A → Apply Location`
6. Verificar: en Object Mode, `Location: 0, 0, 0` y el objeto sobre el plano Y=0

---

## 8.7 Escala y Unidades

### 8.7.1 Configuración de unidades en Blender

`Scene Properties → Units`:

| Parámetro | Valor |
|---|---|
| Unit System | Metric |
| Unit Scale | 1.0 |
| Length | Meters |

1 unidad de Blender = 1 metro = 1 unidad de Godot 4.

Antes de exportar, siempre ejecutar `Ctrl+A → Apply → All Transforms` en todos los objetos.

### 8.7.2 Escala de referencia del mundo del juego

Limonchero es el personaje de referencia — altura ~1.75m (100% en la jerarquía de la Sección 5). Todos los props deben escalar respecto a esta altura.

**Referencias de escala concretas para el club:**

| Objeto | Altura/Dimensión |
|---|---|
| Limonchero (referencia) | 1.75 m |
| Altura de silla de comedor | 0.45 m (asiento) / 0.90 m (respaldo) |
| Altura de mesa de reservado | 0.75 m |
| Altura de barra del club | 1.10 m |
| Copa de bourbon | 0.12 m de alto |
| Encendedor de oro (R3) | 0.07 m de largo |
| Puerta de oficina | 2.10 m × 0.90 m |

### 8.7.3 Verificar escala de asset generado por IA

1. Tener en la escena un cubo de referencia de 1.75m de alto (`S → Z → 1.75`)
2. Importar el asset generado y comparar visualmente
3. Ajustar escala y aplicar: `Ctrl+A → Apply → Scale`

---

## 8.8 Estrategia de LOD para Entornos

### 8.8.1 Qué props necesitan LOD

| Necesitan LOD | No necesitan LOD |
|---|---|
| Sillas y mesas del salón principal (muchas, vistas a distancia) | Props de pista interactuables (solo se ven de cerca) |
| Lámparas (aparecen en múltiples zonas) | Props únicos de escena del crimen |
| Elementos repetidos (botellas en estante de barra) | Estructuras de sala |
| La barra (visible desde distancia variable) | Props de un único ángulo |

### 8.8.2 Distancias de transición (primera persona, FOV 85°, 1080p)

| LOD | Distancia de transición |
|---|---|
| LOD0 → LOD1 | 4–6 metros |
| LOD1 → LOD2 | 10–15 metros |
| LOD2 → culled | 20–25 metros |

En Godot 4: configurar en `GeometryInstance3D` → `LOD`.

### 8.8.3 Objetos para MultiMeshInstance3D

Para mantenerse bajo 100 draw calls por frame, los props repetidos idénticos deben usar **MultiMeshInstance3D** en Godot. Condición: mismo mesh, mismo material.

Candidatos en el club:
- Sillas idénticas en el salón principal
- Vasos y copas decorativos en la barra
- Botellas en estante de barra

---

## 8.9 Reglas de UV Mapping

### 8.9.1 Unique UVs vs. Tiling UVs

| Tipo de UV | Cuándo usar |
|---|---|
| **Unique UV** | Props interactuables, assets de pista, personajes |
| **Tiling UV** | Estructuras de sala — suelo, paredes, techo (escalar a ~1 tile por metro) |

Padding entre islas: mínimo 4px en la resolución final de la textura.

### 8.9.2 Unwrap estándar en Blender para props low-poly

1. `Tab` → Edit Mode → seleccionar todo (`A`)
2. Marcar seams en bordes de silueta: `Ctrl+E → Mark Seam`
3. `U → Unwrap` (Smart UV Project para props de fondo; Unwrap manual para props de pista)
4. En UV Editor: verificar que no hay islas superpuestas
5. `UV → Pack Islands` — margen 0.01 (4px en 512×512)
6. Verificar texel density con checker pattern

### 8.9.3 Lightmap UV

Con Forward+ renderer y luces dinámicas, **no es necesario UV1** en ningún asset actualmente. Solo UV0. Si en el futuro se decide hornear iluminación estática, los assets `struct_*` deberán tener UV1 generado con `U → Lightmap Pack`.

---

## 8.10 Checklist Pre-exportación

Este checklist se completa para cada asset antes de exportar de Blender. Un asset no está listo si cualquier punto falla.

### Geometría

- [ ] Triángulos dentro del budget de la categoría (ver 8.4)
- [ ] Sin n-gons — verificar: `Edit Mode → Select → Select All by Trait → Faces by Sides → mayor que 4`
- [ ] Sin geometría duplicada o interior — `Mesh → Clean Up → Delete Loose` y `Merge by Distance`
- [ ] Sin vértices sueltos — `Select → Select All by Trait → Non Manifold`
- [ ] Normales apuntan hacia afuera — `Viewport Overlay → Face Orientation` (azul = correcto). Reparar: `Mesh → Normals → Recalculate Outside`
- [ ] Sin escala residual — `Ctrl+A → Apply → All Transforms` ejecutado
- [ ] Origen en posición correcta según categoría (ver 8.6)

### Materiales y Texturas

- [ ] Un material único (o mínimo necesario con justificación)
- [ ] Material usa solo Principled BSDF
- [ ] Nombre del material sigue la convención de nomenclatura
- [ ] Texturas en PNG, potencia de 2, resolución correcta para su tier (ver 8.3)
- [ ] Valores de Roughness y Metallic corresponden a la paleta del club (ver 8.5.4)
- [ ] Sin Normal Map salvo justificación documentada

### UV

- [ ] Unwrap completo — sin islas degeneradas
- [ ] Sin islas superpuestas
- [ ] Padding mínimo 4px en la resolución de textura objetivo

### Escala y Orientación

- [ ] Escala correcta respecto al cubo de referencia de 1.75m
- [ ] `Apply All Transforms` ejecutado — Location, Rotation y Scale son (0,0,0), (0,0,0), (1,1,1)

### Archivo y Nombre

- [ ] Archivo `.blend` sigue la convención (sin espacios, sin acentos)
- [ ] Archivo `.glb` exportado sigue la convención
- [ ] Texturas nombradas con sufijo correcto (`_albedo`, `_roughness`, etc.)

### Verificación en Godot

- [ ] `.glb` importado muestra escala `(1,1,1)` en el nodo raíz
- [ ] Sin warnings de importación en el Output de Godot
- [ ] Material asignado correctamente — colores y roughness son los esperados
- [ ] Asset descansa sobre el plano Y=0

---

## 8.11 Errores Comunes con Assets de IA Generativa

La IA generativa produce assets que sistemáticamente presentan los mismos problemas técnicos. Esta sección los cataloga con solución específica en Blender.

### Error 1 — Geometría sucia: N-gons, triangulación caótica y caras internas

**Síntoma:** Manchas de iluminación irregulares, caras "rotas" desde ciertos ángulos, Decimate impredecible.

**Corrección en Blender:**
1. `Mesh → Clean Up → Merge by Distance` (distancia 0.001m)
2. `Mesh → Clean Up → Delete Loose`
3. Para caras internas: `Select → Select All by Trait → Interior Faces` → eliminar (`X → Faces`)
4. Para n-gons: `Select All by Trait → Faces by Sides > 4` → `Ctrl+T` para triangular
5. Si la topología está completamente caótica: modifier **Remesh** (Voxel, tamaño 0.005–0.01m) → luego Decimate

### Error 2 — Normales invertidas o inconsistentes

**Síntoma:** Partes del mesh invisibles desde ciertos ángulos, o zonas negras en iluminación.

**Corrección en Blender:**
1. `Viewport Overlay → Face Orientation` — azul = correcto, rojo = invertido
2. Solución rápida: `Edit Mode → A → Mesh → Normals → Recalculate Outside`
3. Para flat shading (estética del juego): `Object Mode → Right Click → Shade Flat`

**Importante:** El flat shading total es el default. Cada face debe tener su propia normal para que las facetas sean visibles — es la estética del juego.

### Error 3 — Escala incorrecta al importar

**Síntoma:** Asset aparece 100 veces más grande o pequeño que los otros objetos.

**Corrección en Blender:**
1. Comparar contra el cubo de referencia de 1.75m
2. Escalar: `S` → ingresar factor de corrección (ej. si está 100 veces grande: `S → 0.01`)
3. Aplicar: `Ctrl+A → Apply → Scale`
4. Verificar unidades: `Scene Properties → Units → Metric, Unit Scale 1.0`

### Error 4 — Materiales PBR incompatibles o faltantes

**Síntoma A — Rosa/magenta:** Godot no encontró la textura (rutas absolutas rotas).
**Corrección:** `File → External Data → Make All Paths Relative` + `Pack All Into .blend`. Al exportar como `.glb`, las texturas se empaquetan en el binario.

**Síntoma B — Gris uniforme:** El generador exportó sin materiales.
**Corrección:** Asignar manualmente Principled BSDF con textura albedo y re-exportar.

**Síntoma C — Shader incompatible** (Arnold, V-Ray, etc.):
**Corrección:** En Shader Editor, reemplazar todos los nodos no estándar por Principled BSDF limpio.

### Error 5 — Múltiples materiales por objeto

**Síntoma:** El asset crea 8, 12 o más nodos de material en Godot, disparando el budget de draw calls.

**Corrección en Blender:**
1. `Edit Mode → A → asignar un único material base`
2. Si diferentes zonas necesitan propiedades distintas, consolidar en máximo 2 materiales con diferentes rangos del UV atlas
3. Nunca más de 2 materiales por prop estático

### Error 6 — Smooth shading que oculta las facetas

**Síntoma:** El asset importado tiene curvas suaves — no se ven las facetas. Contradice la estética del juego.

**Corrección en Blender:**
1. `Object Mode → Right Click → Shade Flat`
2. Si algunas aristas necesitan suavidad específica (ej. borde superior de una copa de cristal): marcar esas aristas como `Sharp` (`Edit Mode → Edge → Mark Sharp`) y activar `Auto Smooth` con ángulo ~30°

### Error 7 — Objeto no manifold (mesh no cerrado)

**Síntoma:** Agujeros visibles en la geometría. En Godot se ven como "ventanas" a través del objeto.

**Corrección en Blender:**
1. `Edit Mode → Select → Select All by Trait → Non Manifold` — selecciona bordes problemáticos
2. Para agujeros: `F` para rellenar, o `Alt+F` para triangular el relleno
3. Para intersecciones complejas: modifier **Boolean** con sólido de cierre, o reconstruir con Remesh Voxel

### Error 8 — UVs generadas incorrectamente

**Síntoma:** Textura distorsionada o estirada, checker pattern con cuadros de tamaño muy desigual.

**Corrección en Blender:**
1. `Edit Mode → A → U → Smart UV Project` como punto de partida
2. Para props de pista: unwrap manual con seams en bordes de silueta (ver 8.9.2)
3. Re-proyectar la textura albedo sobre el nuevo UV


---

## 9. Reference Direction

> *[Pendiente — completar con /art-bible]*
