extends CharacterBody3D
class_name PlayerAgent

@export var is_away_team: bool = false
@export var player_number: String = "00"

@onready var torso_mesh: CSGBox3D = $Armature/Torso/TorsoMesh
@onready var number_front: Label3D = $Armature/Torso/NumberFront
@onready var number_back: Label3D = $Armature/Torso/NumberBack

func _ready() -> void:
	number_front.text = player_number
	number_back.text = player_number
	var mat := StandardMaterial3D.new()
	if is_away_team:
		mat.albedo_color = Color(0.8, 0.2, 0.2) # Red
	else:
		mat.albedo_color = Color(0.2, 0.4, 0.8) # Blue
	torso_mesh.material = mat
