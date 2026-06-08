class_name Enemy
extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var speed = 50

var direction = "right"

var switching_direction = false

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_infront_bottom: RayCast2D = $RayCastInfrontBottom
@onready var ray_cast_bottom: RayCast2D = $RayCastBottom
@onready var timer: Timer = $Timer

func _process(delta: float):
	if direction == "right":
		position.x += speed * delta
		if ray_cast_right.is_colliding():
			direction = "left"
			animated_sprite_2d.flip_h = true
	
	if direction == "left":
		position.x -= speed * delta
		if ray_cast_left.is_colliding():
			direction = "right"
			animated_sprite_2d.flip_h = false
	
	if not ray_cast_bottom.is_colliding() and switching_direction == false: # if about to "fall" and 
		if direction == "right":
			direction = "left"
			switching_direction = true;
		else:
			switching_direction = false;
		
		if direction == "left":
			direction = "right"
			switching_direction = true;
		else:
			switching_direction = false;
			
	
	
