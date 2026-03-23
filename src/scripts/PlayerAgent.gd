extends CharacterBody3D
class_name PlayerAgent

@export var is_away_team: bool = false
@onready var torso_mesh: CSGBox3D = $Armature/Torso/TorsoMesh

func _ready() -> void:
	var mat := StandardMaterial3D.new()
	if is_away_team:
		mat.albedo_color = Color(0.8, 0.2, 0.2) # Red
	else:
		mat.albedo_color = Color(0.2, 0.4, 0.8) # Blue
	torso_mesh.material = mat
