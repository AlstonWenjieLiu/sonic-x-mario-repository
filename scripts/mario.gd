class_name mario
extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -600.0
var falling = false
var going_up = false

func _ready() -> void:
	hide()
	set_process(false)
	set_physics_process(false)
	process_mode = PROCESS_MODE_DISABLED
	get_node("CollisionShape2D").set_deferred("disabled", true)
	

func _process(delta):
	falling = velocity.y > 0
	going_up = velocity.y < 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor ():
		velocity += get_gravity() * delta
		if falling:
			animated_sprite_2d.play("fall")
		else:
			animated_sprite_2d.play("jump")

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if direction > 0:
		animated_sprite_2d.flip_h = false;
		if !falling && !going_up:
			animated_sprite_2d.play("run_a")
	elif direction < 0:
		animated_sprite_2d.flip_h = true;
		if !falling && !going_up:
			animated_sprite_2d.play("run_a")
	elif direction == 0:
		if !falling && !going_up:
			animated_sprite_2d.play("idle")
	
	move_and_slide()
