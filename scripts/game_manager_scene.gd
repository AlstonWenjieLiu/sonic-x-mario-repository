extends Node

var current_character := "Sonic"
@onready var sonic_scene_path = $"../Player"
@onready var mario_scene_path = $"../Player2"
@onready var coords = $"../Player".global_position

func _process(delta):
	coords = $"../Player".global_position
	if Input.is_action_just_pressed("switch_to_sonic"):
		current_character = "Sonic"
		mario_scene_path.hide()
		mario_scene_path.set_process(false)
		mario_scene_path.set_physics_process(false)
		print("Switched to " + current_character)
	elif Input.is_action_just_pressed("switch_to_mario"):
		current_character = "mario"
		$"../Player2".hide() # here
		$"../Player2".set_process(false)
		$"../Player2".set_physics_process(false)
		print("Switched to " + current_character)
