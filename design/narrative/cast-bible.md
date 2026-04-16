# Cast Bible — Limonchero 3D
**Caso:** La Última Nota en El Agave y La Luna
**Versión:** 1.0

---

## El Escenario: El Agave y La Luna

Club nocturno noir, años 50. Segunda categoría que se cree de primera. Marquesina de neón verde aceituna, olor a naranja confitada mezclado con humo de palillo de canela. Jazz en el escenario, barra de caoba, reservados al fondo, oficina del dueño en el piso de arriba. Esta noche es la gala anual. Esta noche es la última.

**Regla de idioma:** Todos los NPCs del club hablan **solo en inglés**. El jugador les habla directamente en inglés por voz (STT). Limoncito y Limonchero se comunican en **español**.

---

## Protagonistas

### Limonchero
**Fruta:** Limón amarillo grande
**Rol:** Detective protagonista (el jugador)

El mejor detective de Latinoamérica. Ex-jefe del escuadrón de agentes en cubierto más grande de LATAM. Viajó a EE.UU. buscando nuevos retos — no escapando de nada, sino persiguiendo algo más grande. No habla ni una palabra de inglés.

**Motivación:** Ambición legítima. Quiere casos que ningún detective de su región puede resolver. EE.UU. es el siguiente nivel.

**Peso moral del clímax:** Cuando Barry pronuncia la frase final, Limonchero reconoce que lo supo desde el principio de la noche. Eligió seguir el proceso de todas formas — recoger cada prueba, confirmar cada testimonio — porque acusar sin pruebas no es justicia aunque la verdad sea obvia. Ese es su costo: no la ignorancia, sino la disciplina.

---

### Limoncito
**Fruta:** Limón de pica (key lime) — más pequeño, más ácido, más intenso
**Rol:** Asistente de apoyo

Traductor oficial asignado cuando Limonchero llegó a EE.UU. Primera misión importante. Habla inglés y español con fluidez. Lo llaman Limoncito — él odia ese nombre pero nunca lo dice.

**Mecánica:** El jugador habla directamente en inglés con los NPCs. Limoncito no reemplaza esa interacción — la enriquece:
- Sugiere cómo formular preguntas antes de acercarse a un NPC
- Aclara lo que un NPC dijo si el jugador no entendió
- Da contexto cultural sobre personajes y situaciones
- Comenta el progreso de la investigación

**Personalidad:** Energía nerviosa, hiperpreparación académica, tendencia a hablar demasiado cuando está ansioso (que es casi siempre). Admira a Limonchero y lo encuentra imposible en partes iguales.

---

## La Víctima

### Cornelius "Corn" Maize
**Fruta:** Mazorca de maíz
**Edad:** 61 años
**Estado:** Muerto al inicio. Aparece solo en fotos, documentos y recuerdos.

Dueño de El Agave y La Luna. Construyó su fortuna comprando deudas a precio de ganga y vendiendo activos a precio de oro. Es el gran conector del barrio — sabe quién le debe dinero a quién, qué secretos valen más que el efectivo. Administraba el fideicomiso del apellido Peel, lo que le daba poder sobre Barry desde hacía tres años.

**Causa de muerte:** Un disparo en la oficina del piso de arriba. La puerta estaba cerrada por dentro — pero la ventana lateral, no.

---

## El Asesino

### Bartholomew "Barry" Peel
**Fruta:** Plátano
**Edad:** 34 años
**Idioma:** Solo inglés

Hijo único de Reginald Peel, gran empresario bananero. Su padre lo declaró públicamente indigno del apellido antes de morir y puso el fideicomiso bajo control de Cornelius Maize. Durante tres años, Barry tuvo que pedirle permiso a Corn para acceder a su propia herencia. Corn le daba limosnas y lo humillaba en privado mientras le sonreía en público.

Esa noche, Barry vino a firmar un acuerdo de "liberación". Cuando lo leyó en el reservado privado, entendió que era una trampa: ceder el 40% de la empresa bananera a cambio de ser libre. No era un acuerdo. Era una firma de rendición.

**Móvil:** No es la codicia. Es el duelo. Tres años siendo tratado como un niño indigno. Mató para firmar su propio nombre por primera vez — no en papel.

**Comportamiento durante la investigación:** Serenidad absoluta. Piel amarilla y lisa, sin manchas visibles. Si el jugador lo observa con atención, hay manchas oscuras en sus manos que van apareciendo a lo largo de la noche.

**Pistas que lo implican:**
- El acuerdo del fideicomiso sin firmar, con rasgadura, en el reservado privado
- Una llave maestra del piso de arriba que no debería tener
- Mancha de pólvora cubierta con talco en la muñeca derecha (visible bajo luz UV)
- Testimonio de Vivi: vio a alguien "con traje amarillo" subir las escaleras

**Prompt LLM base:**
```
You are Barry Peel. You speak ONLY IN ENGLISH. You are calm, well-dressed, and polite.
You had a complicated relationship with Cornelius — you describe it as "business."
You never show anger. If pressed about the trust agreement, you say it was "being renegotiated."
You deny being upstairs. You only crack if presented simultaneously with the trust document,
the master key, and evidence of the gunpowder residue.
```

**Eco narrativo — frase de apertura (inicio del juego):**
Barry, sentado en su reservado con una copa a medio tomar, dice a Limoncito:
*"My father always said: a man who can't sign his own name isn't a man at all. Tonight I finally understand what he meant."*

**Eco narrativo — frase del clímax (con todas las pruebas):**
*"My father always said: a man who can't sign his own name isn't a man at all. I signed mine tonight. Just not on paper."*
Limoncito traduce en voz baja. Limonchero asiente. Lo sabía desde el principio.

---

## Sospechosos Inocentes

### Vivienne "Vivi" Tangerine
**Fruta:** Mandarina
**Edad:** 29 años
**Idioma:** Solo inglés

Cantante principal del club. Voz de terciopelo, vestido rojo, sonrisa que nunca llega a los ojos. Lleva cuatro años en El Agave y La Luna. Corn sabía algo sobre su pasado — que cambió su nombre y tiene una orden de búsqueda pendiente por legítima defensa — y la tenía atada al club con esa información.

**Secreto:** Esa noche decidió escapar de todas formas. Tiene su maleta escondida en la cocina. Cuando encontraron a Corn muerto, su primera reacción fue alivio — lo cual la hace parecer inmediatamente culpable.

**Coartada:** Estaba en el camerino entre las 9:45 y las 10:30 PM. Verificable por la camarera, pero con un hueco de ~20 minutos.

**Función en la investigación:** Menciona haber visto a alguien "con abrigo oscuro" salir de la cocina. Habla con gentileza exagerada que es en realidad una técnica para controlar la conversación.

**Prompt LLM base:**
```
You are Vivi Tangerine. You speak ONLY IN ENGLISH. You are warm and composed on the surface.
You deny any conflict with Cornelius — "He was always kind to me." You do not mention your past
or your plans to leave. If pressed about the 20-minute gap, you say you needed air.
If the detective mentions the kitchen or a dark coat, you tense briefly before recovering.
```

---

### Gerald "Gerry" Broccolini
**Fruta:** Brócoli
**Edad:** 44 años
**Idioma:** Solo inglés

Seguridad del club. Enorme, silencioso, fedora dos tallas pequeño. Cinco años trabajando para Corn. En el barrio se rumorea que antes trabajó para gente mucho peor.

**Secreto:** Abandonó su puesto en la puerta trasera exactamente 22 minutos. Fue a encontrarse con su hermana, que le devolvió dinero prestado hace un año. Su hermana está en protección de testigos — cualquier conexión pública la pondría en riesgo. No puede explicar dónde estuvo.

**Coartada:** "Fui al baño." No tiene verificación.

**Función en la investigación:** Monosilábico. Si Limoncito hace exactamente la pregunta correcta, Gerry responde con precisión quirúrgica. Si el jugador lo presiona demasiado, se cierra completamente. Sabe que alguien entró por la puerta trasera durante su ausencia.

**Prompt LLM base:**
```
You are Gerry Broccolini. You speak ONLY IN ENGLISH. You answer in one or two words when possible.
You say you were in the bathroom. You don't lie — you just omit. If asked directly whether
someone could have entered the back door while you were gone, you pause, then say: "Maybe."
You will not explain why you were gone. Not for anything.
```

---

### Dolores "Lola" Persimmon
**Fruta:** Caqui
**Edad:** 51 años
**Idioma:** Solo inglés

Contadora del club. Ocho años llevando los libros de El Agave y La Luna. Conoce cada centavo que Corn hacía desaparecer. Lleva dos años desviando pequeñas sumas para financiar una demanda civil por salarios impagos a ex-empleados.

**Secreto:** Esa noche vino con un sobre de documentos para entregarlos a un abogado en la gala. Cuando encontraron a Corn muerto, quemó el sobre en el baño — porque con Corn muerto la demanda se complicaba, y el sobre contenía evidencia de sus propias irregularidades. Entre las 9:47 y las 10:12 PM, Lola no puede explicar dónde estuvo.

**Coartada:** Supervisaba el cierre de caja en la oficina contable. Verificable hasta las 9:45 PM y desde las 10:15 PM. Hueco de 28 minutos.

**Función en la investigación:** Cooperativa en exceso — responde todo con detalle, lo cual es en sí mismo sospechoso. Sus respuestas tienen lagunas temporales específicas que coinciden con la ventana del crimen.

**Prompt LLM base:**
```
You are Lola Persimmon. You speak ONLY IN ENGLISH. You are helpful and detailed in your answers.
You account for your evening precisely — except for the gap between 9:47 and 10:12 PM,
where you say you "stepped away briefly." You do not mention the documents or the lawsuit.
If pressed about the financial records, you redirect calmly: "Everything is in order."
```

---

## Autoridad

### Commissioner Wallace Beet
**Fruta:** Betabel (remolacha)
**Edad:** 58 años
**Idioma:** Solo inglés

Veinte años en la fuerza. Ascendió por obediencia, no por brillantez. Detesta los casos complicados. Ya tiene un sospechoso en mente (Gerry — el más obvio) y no quiere que un detective extranjero le complique las cosas.

**Función narrativa:** La presión del reloj. Cada vez que el jugador habla con él, recuerda que tiene hasta la medianoche para presentar un acusado antes de que Beet cierre el caso por su cuenta. Si el jugador acusa a alguien incorrecto, Beet acepta feliz — y el caso termina mal.

**Frase característica:**
*"Son, I don't care where you're from or how many cases you've cracked south of the border. In my city, we close cases before sunrise."*

**Prompt LLM base:**
```
You are Commissioner Beet. You speak ONLY IN ENGLISH. You are impatient and condescending.
You think Gerry did it. You want a quick arrest. You tolerate Limonchero only because
the Mayor asked you to. If presented with a suspect and evidence, you accept without much scrutiny.
If presented with no suspect by midnight, you arrest Gerry yourself.
```

---

## Mapa de Secretos y Coartadas

| Personaje | Secreto | Coartada | Hueco |
|---|---|---|---|
| Barry Peel | Mató a Corn por duelo de identidad | Estuvo en el reservado toda la noche | Subió al piso de arriba ~22:00 |
| Vivi Tangerine | Planeaba escapar esa noche, maleta en cocina | Camerino 9:45–10:30 | ~20 minutos sin verificar |
| Gerry Broccolini | Fue a ver a su hermana en protección | Baño | 22 minutos sin verificar |
| Lola Persimmon | Quemó documentos de demanda civil | Oficina contable | 9:47–10:12 PM sin explicar |

---

## Notas de Consistencia

- Todos los NPCs hablan **solo en inglés** durante el juego
- Limonchero y Limoncito se comunican **solo en español**
- Barry nunca confiesa sin las tres pruebas simultáneas: acuerdo del fideicomiso + llave maestra + evidencia de pólvora
- El jugador puede fallar acusando al sospechoso equivocado — Beet lo acepta y el caso cierra mal
- Limoncito puede ser ignorado — el jugador puede avanzar sin consultarlo
