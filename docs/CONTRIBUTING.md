# Asset Pipeline Documentation

## 3D Models
- **Format**: All 3D models should be exported as `.glb` files.
- **Polycount**: Player meshes must stay under 500 triangles for the primary LOD and 150 triangles for the distant LOD.
- **Scale**: Ensure 1 unit in Blender = 1 meter in Godot. Apply all transforms before exporting.
- **Rigging**: Mixamo base skeleton is allowed, but ensure root bone is named `Armature`.

## Textures and Materials
- Use Godot's built-in StandardMaterial3D where possible.
- Textures should be power-of-two (e.g. 1024x1024 or 512x512).

## Naming Conventions
- Assets should be named with standard `snake_case`.
- e.g. `player_mesh.glb`, `hardwood_floor_normal.png`.
