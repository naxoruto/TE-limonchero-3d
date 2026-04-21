# Art Bible — Limonchero 3D (Detective Noir VR)
**Versión:** 0.1 (en progreso)
**Fecha:** 2026-04-16
**Equipo:** Ignacio Cuevas, Martin Cevallos, Sofia Meza, Diego Espinosa
**Motor:** Godot 4 · Plataforma objetivo: Meta Quest 2

---

## Estado de Secciones

| Sección | Estado |
|---|---|
| 1. Visual Identity Statement | Pendiente |
| 2. Mood & Atmosphere | Pendiente |
| 3. Shape Language | Pendiente |
| 4. Color System | Pendiente |
| 5. Character Design Direction | **Completa** |
| 6. Environment Design Language | Pendiente |
| 7. UI/HUD Visual Direction | **Completa** |
| 8. Asset Standards | Pendiente |
| 9. Reference Direction | Pendiente |

---

## 1. Visual Identity Statement

> *[Pendiente — completar con /art-bible]*

---

## 2. Mood & Atmosphere

> *[Pendiente — completar con /art-bible]*

---

## 3. Shape Language

> *[Pendiente — completar con /art-bible]*

---

## 4. Color System

> *[Pendiente — completar con /art-bible]*

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

> *[Pendiente — completar con /art-bible]*

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

> *[Pendiente — completar con /art-bible]*

---

## 9. Reference Direction

> *[Pendiente — completar con /art-bible]*
