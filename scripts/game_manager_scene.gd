extends Node
@onready var sonic_scene_path = $"../Player"
@onready var mario_scene_path = $"../Player2"
@onready var current_character = sonic_scene_path
@onready var camera_scene_path = $"../Player/Camera2D"
@onready var music_scene_path = $"../Player/Music"
@onready var coords = Vector2(0, 0)
@onready var swap = false # this is for the future: wheter there will be moments for character swapping or leaving at the place

# might need to update if there are more character to be added
func _process(delta):
	print(coords)
	if Input.is_action_just_pressed("switch_to_sonic"):
		current_character = sonic_scene_path
		sonic_scene_path.global_position = coords
		if current_character:
			current_character.global_position = coords
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
		camera_scene_path.reparent(sonic_scene_path)
		music_scene_path.reparent(sonic_scene_path)
		camera_scene_path.position = Vector2.ZERO
		camera_scene_path = $"../Player/Camera2D"
		print("Switched to " + str(current_character))
	elif Input.is_action_just_pressed("switch_to_mario"):
		current_character = mario_scene_path
		mario_scene_path.global_position = coords
		if current_character:
			current_character.global_position = coords
		sonic_scene_path.hide()
		sonic_scene_path.set_process(false)
		sonic_scene_path.set_physics_process(false)
		mario_scene_path.show()
		mario_scene_path.set_process(true)
		mario_scene_path.set_physics_process(true)
		sonic_scene_path.process_mode = PROCESS_MODE_DISABLED
		mario_scene_path.process_mode = Node.PROCESS_MODE_INHERIT
		sonic_scene_path.get_node("CollisionShape2D").set_deferred("disabled", true)
		mario_scene_path.get_node("CollisionShape2D").set_deferred("disabled", false)
		camera_scene_path.reparent(mario_scene_path)
		music_scene_path.reparent(mario_scene_path)
		camera_scene_path.position = Vector2.ZERO
		camera_scene_path = $"../Player2/Camera2D"
		print("Switched to " + str(current_character))
	if current_character:
		coords = current_character.global_position
