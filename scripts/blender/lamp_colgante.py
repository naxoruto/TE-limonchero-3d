"""
Lámpara colgante noir — low poly
Detective Noir VR / El Cisne Negro
Pegar en Blender > Scripting > Run Script
"""

import bpy

# --- Limpiar objetos anteriores de esta lámpara ---
for obj in list(bpy.data.objects):
    if obj.name.startswith("Lamp_"):
        bpy.data.objects.remove(obj, do_unlink=True)

# --- Materiales ---
def make_mat(name, color, metallic=0.0, roughness=0.8, emit_strength=0.0):
    if name in bpy.data.materials:
        bpy.data.materials.remove(bpy.data.materials[name])
    mat = bpy.data.materials.new(name=name)
    mat.use_nodes = True
    bsdf = mat.node_tree.nodes["Principled BSDF"]
    bsdf.inputs["Base Color"].default_value = (*color, 1.0)
    bsdf.inputs["Metallic"].default_value = metallic
    bsdf.inputs["Roughness"].default_value = roughness
    if emit_strength > 0:
        bsdf.inputs["Emission Color"].default_value = (*color, 1.0)
        bsdf.inputs["Emission Strength"].default_value = emit_strength
    return mat

mat_metal = make_mat("Noir_Metal",  (0.08, 0.08, 0.09), metallic=0.9, roughness=0.3)
mat_shade = make_mat("Noir_Shade",  (0.10, 0.08, 0.05), metallic=0.5, roughness=0.6)
mat_bulb  = make_mat("Noir_Bulb",   (1.00, 0.88, 0.55), emit_strength=3.0)

parts = []

# 1. Tope de techo (cilindro aplastado)
bpy.ops.mesh.primitive_cylinder_add(vertices=8, radius=0.07, depth=0.05, location=(0, 0, 0.83))
o = bpy.context.active_object
o.name = "Lamp_Tope"
o.data.materials.append(mat_metal)
parts.append(o)

# 2. Cable (cilindro fino)
bpy.ops.mesh.primitive_cylinder_add(vertices=6, radius=0.012, depth=0.78, location=(0, 0, 0.42))
o = bpy.context.active_object
o.name = "Lamp_Cable"
o.data.materials.append(mat_metal)
parts.append(o)

# 3. Pantalla (cono frustum — boca ancha abajo, estrecho arriba)
bpy.ops.mesh.primitive_cone_add(vertices=8, radius1=0.32, radius2=0.07, depth=0.26, location=(0, 0, 0.04))
o = bpy.context.active_object
o.name = "Lamp_Pantalla"
o.data.materials.append(mat_shade)
parts.append(o)

# 4. Aro decorativo (torus en la boca superior de la pantalla)
bpy.ops.mesh.primitive_torus_add(
    major_radius=0.085, minor_radius=0.014,
    major_segments=8, minor_segments=4,
    location=(0, 0, 0.17)
)
o = bpy.context.active_object
o.name = "Lamp_Aro"
o.data.materials.append(mat_metal)
parts.append(o)

# 5. Bombilla (esfera pequeña dentro de la pantalla)
bpy.ops.mesh.primitive_uv_sphere_add(segments=8, ring_count=5, radius=0.07, location=(0, 0, -0.08))
o = bpy.context.active_object
o.name = "Lamp_Bombilla"
o.data.materials.append(mat_bulb)
parts.append(o)

# --- Parentar todo al tope para mover la lámpara como una unidad ---
bpy.ops.object.select_all(action='DESELECT')
for obj in parts:
    obj.select_set(True)
bpy.context.view_layer.objects.active = parts[0]  # Lamp_Tope como padre
bpy.ops.object.parent_set(type='OBJECT', keep_transform=True)

# Deseleccionar
bpy.ops.object.select_all(action='DESELECT')

print("Lámpara noir creada. Selecciona 'Lamp_Tope' para moverla completa.")
print("Exportar: File > Export > glTF 2.0 (.glb)")
