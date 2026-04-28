import bpy
import bmesh
import math
import random

def create_material(name, hex_color, metallic=0.0, roughness=1.0, emission=False, emission_strength=1.0):
    if name in bpy.data.materials: return bpy.data.materials[name]
    mat = bpy.data.materials.new(name=name)
    mat.use_nodes = True
    nodes = mat.node_tree.nodes
    out = nodes.get("Material Output")
    hex_color = hex_color.lstrip('#')
    r, g, b = tuple(int(hex_color[i:i+2], 16)/255.0 for i in (0, 2, 4)) if len(hex_color) == 6 else (1, 1, 1)
    r = r ** 2.2; g = g ** 2.2; b = b ** 2.2
    
    bsdf = nodes.get("Principled BSDF")
    if not bsdf:
        bsdf = nodes.new(type='ShaderNodeBsdfPrincipled')
        mat.node_tree.links.new(bsdf.outputs['BSDF'], out.inputs['Surface'])
    
    bsdf.inputs['Base Color'].default_value = (r, g, b, 1.0)
    bsdf.inputs['Metallic'].default_value = metallic
    bsdf.inputs['Roughness'].default_value = roughness
    if emission:
        bsdf.inputs['Emission Color'].default_value = (r, g, b, 1.0)
        bsdf.inputs['Emission Strength'].default_value = emission_strength
    return mat

mat_wood = create_material("DetailWood", "3A2A1A", roughness=0.8)
mat_chrome = create_material("Chrome", "C8A040", metallic=0.8, roughness=0.3)
mat_glass = create_material("Glass", "FFFFFF", roughness=0.0)
mat_glass.blend_method = 'BLEND'
mat_cloth = create_material("TableCloth", "F5F0E8", roughness=1.0)
mat_lamp = create_material("TableLamp", "D4A050", emission=True, emission_strength=0.6)

def make_obj(name, bmesh_data, materials=[]):
    me = bpy.data.meshes.new(name)
    bmesh_data.to_mesh(me)
    bmesh_data.free()
    for poly in me.polygons: poly.use_smooth = False
    opt_obj = bpy.data.objects.new(name, me)
    bpy.context.collection.objects.link(opt_obj)
    for mat in materials: opt_obj.data.materials.append(mat)
    return opt_obj

# 1. Stage Props (North Stage is at Y=5 to 7, X=-4 to 4, Z=0.6)
# Mic stand
bm_mic = bmesh.new()
bmesh.ops.create_cylinder(bm_mic, cap_ends=True, segments=6, radius=0.02, depth=1.5)
for v in bm_mic.verts: v.co = (v.co.x, v.co.y + 6, v.co.z + 1.35)
make_obj("MicStand", bm_mic, [mat_chrome])

# Chairs
for i, x_offset in enumerate([-1.5, 1.5]):
    bm_chair = bmesh.new()
    bmesh.ops.create_cube(bm_chair, size=0.4)
    for v in bm_chair.verts: v.co = (v.co.x + x_offset, v.co.y + 6.5, v.co.z + 0.8)
    make_obj(f"StageChair_{i}", bm_chair, [mat_wood])

# Double Bass
bm_bass = bmesh.new()
bmesh.ops.create_cube(bm_bass, size=1)
for v in bm_bass.verts: v.co = (v.co.x*0.6 + 3, v.co.y*0.3 + 6.8, v.co.z*1.8 + 1.5)
make_obj("DoubleBass", bm_bass, [mat_wood])

# 2. Bar Props (West Bar is at X=-4, Y=0 to 6, Z=1.1)
# Stools
for i in range(4):
    bm_stool = bmesh.new()
    bmesh.ops.create_cylinder(bm_stool, cap_ends=True, segments=8, radius=0.3, depth=0.1)
    y_pos = i * 1.5 + 0.5
    x_offset = -3.2 if i % 2 == 0 else -3.0 # irregular
    for v in bm_stool.verts: v.co = (v.co.x + x_offset, v.co.y + y_pos, v.co.z + 0.75)
    make_obj(f"BarStool_{i}", bm_stool, [mat_wood])

# Shaker & Glasses on Bar
for i in range(3):
    bm_shaker = bmesh.new()
    bmesh.ops.create_cylinder(bm_shaker, cap_ends=True, segments=6, radius=0.05, depth=0.2)
    for v in bm_shaker.verts: v.co = (v.co.x - 3.8 + random.uniform(-0.1, 0.1), v.co.y + 2 + i*1.2, v.co.z + 1.2)
    make_obj(f"BarProp_{i}", bm_shaker, [mat_chrome if i==0 else mat_glass])

# 3. Tables (East/South - Avoid central 8x8 floor i.e. X=-4 to 4, Y=-4 to 4)
table_positions = [
    (5, 5), (6, -5), (5, -2), (4.5, 3), (6, 0),
    (-5, -5), (-6, -6), (-4.5, -3)
]
for i, pos in enumerate(table_positions):
    cx, cy = pos
    
    # Table Cloth (Angular cylinder)
    bm_table = bmesh.new()
    bmesh.ops.create_cylinder(bm_table, cap_ends=True, segments=8, radius=0.45, depth=0.75)
    for v in bm_table.verts: v.co = (v.co.x + cx, v.co.y + cy, v.co.z + 0.375)
    make_obj(f"RoundTable_{i}", bm_table, [mat_cloth])
    
    # Lamp
    bm_lamp = bmesh.new()
    bmesh.ops.create_cone(bm_lamp, cap_ends=True, segments=6, radius1=0.1, radius2=0.05, depth=0.2)
    for v in bm_lamp.verts: v.co = (v.co.x + cx, v.co.y + cy, v.co.z + 0.85)
    lamp = make_obj(f"TableLamp_{i}", bm_lamp, [mat_lamp])
    
    # Point light for the table lamp
    lamp_light = bpy.data.lights.new(name=f"LightLamp_{i}", type='POINT')
    lamp_light.energy = 20
    lamp_light.color = (1.0, 0.7, 0.3)
    lamp_obj = bpy.data.objects.new(f"LightLamp_{i}", lamp_light)
    bpy.context.collection.objects.link(lamp_obj)
    lamp_obj.location = (cx, cy, 0.9)
    
    # Glasses
    for j in range(2):
        bm_glass = bmesh.new()
        bmesh.ops.create_cylinder(bm_glass, cap_ends=True, segments=6, radius=0.04, depth=0.1)
        for v in bm_glass.verts: v.co = (v.co.x + cx + random.uniform(-0.2, 0.2), v.co.y + cy + random.uniform(-0.2, 0.2), v.co.z + 0.8)
        make_obj(f"Glass_{i}_{j}", bm_glass, [mat_glass])

# 4. Booth (NW: X=-4.5, Y=3.5)
# Rect table
bm_bt = bmesh.new()
bmesh.ops.create_cube(bm_bt, size=1)
for v in bm_bt.verts: v.co = (v.co.x*0.6 - 4.5, v.co.y*1.2 + 3.5, v.co.z*0.75 + 0.375)
make_obj("BoothTable", bm_bt, [mat_wood])

# Bourbon Glass
bm_bourbon = bmesh.new()
bmesh.ops.create_cylinder(bm_bourbon, cap_ends=True, segments=6, radius=0.06, depth=0.1)
for v in bm_bourbon.verts: v.co = (v.co.x - 4.4, v.co.y + 3.5, v.co.z + 0.8)
make_obj("BoothGlass", bm_bourbon, [mat_glass])

print("Details generation script executed.")
