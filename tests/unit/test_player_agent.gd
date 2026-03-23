extends GutTest

var PlayerAgentScene = preload("res://src/scenes/PlayerAgent.tscn")

func test_default_properties():
	var player = autofree(PlayerAgentScene.instantiate())
	add_child(player)
	
	assert_eq(player.max_speed, 6.0, "Default max speed is 6.0")
	assert_eq(player.acceleration, 12.0, "Default acceleration is 12.0")
	assert_eq(player.friction, 14.0, "Default friction is 14.0")
	
func test_player_team_colors():
	var player = autofree(PlayerAgentScene.instantiate())
	player.is_away_team = true
	# add_child automatically calls _ready()
	add_child(player)
	
	var mesh = player.get_node("Armature/Torso/TorsoMesh")
	var mat_color = mesh.material.albedo_color
	
	assert_almost_eq(mat_color.r, 0.8, 0.01, "Away team is predominantly Red")
	assert_almost_eq(mat_color.b, 0.2, 0.01, "Away team is not Blue")

func test_player_numbers():
	var player = autofree(PlayerAgentScene.instantiate())
	player.player_number = "99"
	add_child(player)
	
	var front = player.get_node("Armature/Torso/NumberFront")
	var back = player.get_node("Armature/Torso/NumberBack")
	
	assert_eq(front.text, "99", "Front number updates correctly via export variable")
	assert_eq(back.text, "99", "Back number updates correctly via export variable")
