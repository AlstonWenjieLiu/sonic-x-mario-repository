class_name Enemy
extends Node2D

var speed = 50

var direction = "right"

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_infront_bottom: RayCast2D = $RayCastInfrontBottom

func _process(delta: float):
	if direction == "right":
		position.x += speed * delta
		if ray_cast_right.is_colliding():
			direction = "left"
	
	if direction == "left":
		position.x -= speed * delta
		if ray_cast_left.is_colliding():
			direction = "right"
	
	if not ray_cast_infront_bottom.is_colliding():
		if direction == "right":
			direction = "left"
		
		if direction == "left":
			direction = "right"
	
	
