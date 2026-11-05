extends Node

var current_character := "Sonic"
var sonic_scene_path := "../Player"
@onready var coords = $"../Player".global_position

func _process(delta):
	coords = $"../Player".global_position
	if Input.is_action_just_pressed("switch_to_sonic"):
		current_character = "Sonic"
		print("Switched to " + current_character)
	elif Input.is_action_just_pressed("switch_to_mario"):
		current_character = "mario"
		print("Switched to " + current_character)
