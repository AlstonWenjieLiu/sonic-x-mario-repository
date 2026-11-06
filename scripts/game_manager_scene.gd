extends Node

var current_character := "Sonic"
@onready var sonic_scene_path = $"../Player"
@onready var mario_scene_path = $"../Player2"
@onready var coords = $"../Player".global_position

# might need to update if there are more character to be added
func _process(delta):
	coords = $"../Player".global_position
	if Input.is_action_just_pressed("switch_to_sonic"):
		current_character = "Sonic"
		mario_scene_path.hide()
		mario_scene_path.set_process(false)
		mario_scene_path.set_physics_process(false)
		sonic_scene_path.show()
		sonic_scene_path.set_process(true)
		sonic_scene_path.set_physics_process(true)
		mario_scene_path.process_mode = PROCESS_MODE_DISABLED
		sonic_scene_path.process_mode = Node.PROCESS_MODE_INHERIT
		mario_scene_path.get_node("CollisionShape2D").set_deferred("disabled", true)
		sonic_scene_path.get_node("CollisionShape2D").set_deferred("disabled", false)
		print("Switched to " + current_character)
	elif Input.is_action_just_pressed("switch_to_mario"):
		current_character = "mario"
		sonic_scene_path.hide()
		sonic_scene_path.set_process(false)
		sonic_scene_path.set_physics_process(false)
		mario_scene_path.show()
		mario_scene_path.set_process(true)
		mario_scene_path.set_physics_process(true)
		sonic_scene_path.process_mode = PROCESS_MODE_DISABLED
		sonic_scene_path.process_mode = Node.PROCESS_MODE_INHERIT
		sonic_scene_path.get_node("CollisionShape2D").set_deferred("disabled", true)
		mario_scene_path.get_node("CollisionShape2D").set_deferred("disabled", false)
		print("Switched to " + current_character)
