"""
Limonchero v3 — Personaje low-poly
Detective Noir VR / El Cisne Negro

Cambios v3 (basado en render de referencia):
  - Gabardina ABIERTA al frente en V, con camiseta negra visible
  - Cabello volumétrico en mechones separados (no un bloque plano)
  - Sombrero más pequeño, deja ver la cabeza y el cabello alrededor
  - Cabeza cúbica con cara frontal en slot separado (para decal de cara)
  - Brazos pegados al cuerpo vía hombros tipo cuña

Cómo aplicar textura de cara:
  1. Selecciona Lim_Cabeza → Material Properties → slot 'Lim_Face'
  2. Base Color → Image Texture → carga tu imagen
"""

import bpy
import math

# ── Limpiar ───────────────────────────────────────────────────────────────────
for obj in list(bpy.data.objects):
    if obj.name.startswith("Lim_"):
        bpy.data.objects.remove(obj, do_unlink=True)

def make_mat(name, color, metallic=0.0, roughness=0.85):
    if name in bpy.data.materials:
        bpy.data.materials.remove(bpy.data.materials[name])
    mat = bpy.data.materials.new(name=name)
    mat.use_nodes = True
    bsdf = mat.node_tree.nodes["Principled BSDF"]
    bsdf.inputs["Base Color"].default_value = (*color, 1.0)
    bsdf.inputs["Metallic"].default_value = metallic
    bsdf.inputs["Roughness"].default_value = roughness
    return mat

# Paleta (calibrada al render de referencia)
mat_skin    = make_mat("Lim_Skin",     (0.55, 0.78, 0.18))
mat_face    = make_mat("Lim_Face",     (0.60, 0.82, 0.22))
mat_hair    = make_mat("Lim_Hair",     (0.12, 0.55, 0.08))
mat_hat     = make_mat("Lim_Hat",      (0.42, 0.30, 0.17))
mat_hatband = make_mat("Lim_HatBand",  (0.30, 0.20, 0.10))
mat_coat    = make_mat("Lim_Coat",     (0.68, 0.56, 0.38))
mat_shirt   = make_mat("Lim_Shirt",    (0.05, 0.05, 0.05))
mat_pants   = make_mat("Lim_Pants",    (0.13, 0.13, 0.16))
mat_shoes   = make_mat("Lim_Shoes",    (0.28, 0.17, 0.09))
mat_belt    = make_mat("Lim_Belt",     (0.30, 0.20, 0.10))
mat_buckle  = make_mat("Lim_Buckle",   (0.65, 0.55, 0.20), metallic=0.9, roughness=0.2)

parts = []
root = None

def spawn(name, mat):
    o = bpy.context.active_object
    o.name = name
    if mat:
        o.data.materials.append(mat)
    parts.append(o)
    return o

# ── CABEZA ────────────────────────────────────────────────────────────────────
bpy.ops.mesh.primitive_cube_add(size=1, location=(0, 0, 1.55))
head = bpy.context.active_object
head.scale = (0.21, 0.17, 0.23)
bpy.ops.object.transform_apply(scale=True)
head.name = "Lim_Cabeza"
head.data.materials.append(mat_skin)   # slot 0 — piel (resto)
head.data.materials.append(mat_face)   # slot 1 — cara (frontal)
for poly in head.data.polygons:
    if poly.normal.y < -0.9:
        poly.material_index = 1
parts.append(head)

# Cuello
bpy.ops.mesh.primitive_cylinder_add(vertices=6, radius=0.075, depth=0.08, location=(0, 0, 1.34))
spawn("Lim_Cuello", mat_skin)

# ── CABELLO (mechones volumétricos) ──────────────────────────────────────────
# Tope — cubre la coronilla
bpy.ops.mesh.primitive_cube_add(size=1, location=(0, 0.015, 1.71))
o = bpy.context.active_object
o.scale = (0.225, 0.18, 0.075)
bpy.ops.object.transform_apply(scale=True)
spawn("Lim_Hair_Top", mat_hair)

# Mechón lateral izq (sobresale hacia el costado)
bpy.ops.mesh.primitive_cube_add(size=1, location=(-0.22, 0.00, 1.58))
o = bpy.context.active_object
o.scale = (0.075, 0.14, 0.14)
o.rotation_euler = (0, math.radians(12), math.radians(18))
bpy.ops.object.transform_apply(scale=True, rotation=True)
spawn("Lim_Hair_L", mat_hair)

# Mechón lateral der
bpy.ops.mesh.primitive_cube_add(size=1, location=(0.21, 0.00, 1.58))
o = bpy.context.active_object
o.scale = (0.07, 0.15, 0.13)
o.rotation_euler = (0, math.radians(-12), math.radians(-15))
bpy.ops.object.transform_apply(scale=True, rotation=True)
spawn("Lim_Hair_R", mat_hair)

# Mechón frontal (flequillo sobre la frente, a un lado)
bpy.ops.mesh.primitive_cube_add(size=1, location=(-0.11, -0.15, 1.63))
o = bpy.context.active_object
o.scale = (0.09, 0.05, 0.07)
o.rotation_euler = (math.radians(-15), 0, math.radians(20))
bpy.ops.object.transform_apply(scale=True, rotation=True)
spawn("Lim_Hair_Fringe", mat_hair)

# Mechón trasero (cubre la nuca)
bpy.ops.mesh.primitive_cube_add(size=1, location=(0, 0.19, 1.55))
o = bpy.context.active_object
o.scale = (0.215, 0.045, 0.21)
bpy.ops.object.transform_apply(scale=True)
spawn("Lim_Hair_Back", mat_hair)

# ── SOMBRERO FEDORA ──────────────────────────────────────────────────────────
bpy.ops.mesh.primitive_cylinder_add(vertices=10, radius=0.27, depth=0.028, location=(0, 0.015, 1.795))
spawn("Lim_Hat_Brim", mat_hat)

bpy.ops.mesh.primitive_cylinder_add(vertices=8, radius=0.158, depth=0.195, location=(0, 0.015, 1.90))
spawn("Lim_Hat_Crown", mat_hat)

bpy.ops.mesh.primitive_cylinder_add(vertices=8, radius=0.161, depth=0.038, location=(0, 0.015, 1.810))
spawn("Lim_Hat_Band", mat_hatband)

# ── TORSO INTERIOR (camiseta negra — se ve en el V) ──────────────────────────
bpy.ops.mesh.primitive_cube_add(size=1, location=(0, 0, 1.07))
torso = bpy.context.active_object
torso.scale = (0.26, 0.17, 0.32)
bpy.ops.object.transform_apply(scale=True)
torso.name = "Lim_Torso"
torso.data.materials.append(mat_shirt)
parts.append(torso)
root = torso

# ── GABARDINA — construcción por paneles para dejar V abierta ────────────────
# Panel trasero
bpy.ops.mesh.primitive_cube_add(size=1, location=(0, 0.11, 1.07))
o = bpy.context.active_object
o.scale = (0.40, 0.06, 0.32)
bpy.ops.object.transform_apply(scale=True)
spawn("Lim_Coat_Back", mat_coat)

# Paneles laterales (cubren los costados del torso)
for side, sx in (("L", -1), ("R", 1)):
    bpy.ops.mesh.primitive_cube_add(size=1, location=(sx * 0.17, 0, 1.07))
    o = bpy.context.active_object
    o.scale = (0.07, 0.20, 0.32)
    bpy.ops.object.transform_apply(scale=True)
    spawn(f"Lim_Coat_Side_{side}", mat_coat)

# Frente inclinado (crea la V): rotación Y → arriba afuera, abajo al centro
for side, sx, roty_deg in (("L", -1, -10), ("R", 1, 10)):
    bpy.ops.mesh.primitive_cube_add(size=1, location=(sx * 0.12, -0.17, 1.08))
    o = bpy.context.active_object
    o.scale = (0.11, 0.04, 0.29)
    o.rotation_euler = (0, math.radians(roty_deg), 0)
    bpy.ops.object.transform_apply(scale=True, rotation=True)
    spawn(f"Lim_Coat_Front_{side}", mat_coat)

# Cuello/cuello alzado del abrigo (collar)
bpy.ops.mesh.primitive_cube_add(size=1, location=(0, 0.02, 1.28))
o = bpy.context.active_object
o.scale = (0.18, 0.10, 0.06)
bpy.ops.object.transform_apply(scale=True)
spawn("Lim_Coat_Collar", mat_coat)

# Cinturón
bpy.ops.mesh.primitive_cube_add(size=1, location=(0, 0, 0.94))
o = bpy.context.active_object
o.scale = (0.42, 0.21, 0.030)
bpy.ops.object.transform_apply(scale=True)
spawn("Lim_Belt", mat_belt)

# Hebilla
bpy.ops.mesh.primitive_cube_add(size=1, location=(0, -0.213, 0.94))
o = bpy.context.active_object
o.scale = (0.045, 0.007, 0.025)
bpy.ops.object.transform_apply(scale=True)
spawn("Lim_Buckle", mat_buckle)

# Faldón del abrigo (bajo el cinturón, llega a mitad de muslo)
bpy.ops.mesh.primitive_cube_add(size=1, location=(0, 0, 0.67))
o = bpy.context.active_object
o.scale = (0.38, 0.20, 0.27)
bpy.ops.object.transform_apply(scale=True)
spawn("Lim_Coat_Skirt", mat_coat)

# Abertura frontal del faldón (línea oscura insinuando la apertura)
bpy.ops.mesh.primitive_cube_add(size=1, location=(0, -0.201, 0.67))
o = bpy.context.active_object
o.scale = (0.012, 0.003, 0.27)
bpy.ops.object.transform_apply(scale=True)
spawn("Lim_Coat_Slit", mat_belt)

# ── BRAZOS (pegados al cuerpo) ───────────────────────────────────────────────
# Torso body extiende a ±0.21. Hombro + brazo centrado en ±0.275 con overlap.
for side, sx in (("L", -1), ("R", 1)):
    x = sx * 0.275

    # Hombro angulado (cuña, no esfera)
    bpy.ops.mesh.primitive_cube_add(size=1, location=(x, 0, 1.21))
    o = bpy.context.active_object
    o.scale = (0.16, 0.17, 0.10)
    o.rotation_euler = (0, math.radians(sx * -12), 0)
    bpy.ops.object.transform_apply(scale=True, rotation=True)
    spawn(f"Lim_Shoulder_{side}", mat_coat)

    # Brazo superior
    bpy.ops.mesh.primitive_cylinder_add(vertices=6, radius=0.085, depth=0.28, location=(x, 0, 1.00))
    spawn(f"Lim_Arm_Up_{side}", mat_coat)

    # Antebrazo
    bpy.ops.mesh.primitive_cylinder_add(vertices=6, radius=0.072, depth=0.28, location=(x, 0, 0.72))
    spawn(f"Lim_Arm_Lo_{side}", mat_coat)

    # Mano
    bpy.ops.mesh.primitive_cube_add(size=1, location=(x, 0.005, 0.53))
    o = bpy.context.active_object
    o.scale = (0.078, 0.062, 0.105)
    bpy.ops.object.transform_apply(scale=True)
    spawn(f"Lim_Hand_{side}", mat_skin)

# ── PIERNAS ──────────────────────────────────────────────────────────────────
for side, sx in (("L", -1), ("R", 1)):
    x = sx * 0.11

    bpy.ops.mesh.primitive_cylinder_add(vertices=6, radius=0.088, depth=0.30, location=(x, 0, 0.40))
    spawn(f"Lim_Thigh_{side}", mat_pants)

    bpy.ops.mesh.primitive_cylinder_add(vertices=6, radius=0.075, depth=0.28, location=(x, 0, 0.13))
    spawn(f"Lim_Shin_{side}", mat_pants)

    bpy.ops.mesh.primitive_cube_add(size=1, location=(x, 0.035, 0.028))
    o = bpy.context.active_object
    o.scale = (0.098, 0.160, 0.046)
    bpy.ops.object.transform_apply(scale=True)
    spawn(f"Lim_Shoe_{side}", mat_shoes)

# ── PARENTAR ─────────────────────────────────────────────────────────────────
bpy.ops.object.select_all(action='DESELECT')
for obj in parts:
    obj.select_set(True)
bpy.context.view_layer.objects.active = root
bpy.ops.object.parent_set(type='OBJECT', keep_transform=True)
bpy.ops.object.select_all(action='DESELECT')

print(f"Limonchero v3 — {len(parts)} partes")
print("  * Gabardina abierta en V con camiseta visible")
print("  * Cabello volumétrico en mechones")
print("  * Cabeza con slot 'Lim_Face' para decal")
