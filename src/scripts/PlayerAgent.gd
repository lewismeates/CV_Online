extends CharacterBody3D
class_name PlayerAgent

@export var is_away_team: bool = false
@export var player_number: String = "00"

@export var max_speed: float = 6.0
@export var acceleration: float = 12.0
@export var friction: float = 14.0

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

func _physics_process(delta: float) -> void:
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var move_dir := Vector3(input_dir.x, 0, input_dir.y).normalized()
	
	if move_dir != Vector3.ZERO:
		velocity.x = move_toward(velocity.x, move_dir.x * max_speed, acceleration * delta)
		velocity.z = move_toward(velocity.z, move_dir.z * max_speed, acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)
		velocity.z = move_toward(velocity.z, 0, friction * delta)
		
	if not is_on_floor():
		velocity.y -= 9.8 * delta
		
	move_and_slide()
