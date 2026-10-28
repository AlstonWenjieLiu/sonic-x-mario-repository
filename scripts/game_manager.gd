extends Node

var score = 0
@onready var user_interface: Label = "res://scenes/user_interface.tscn/MarginContainer/HBoxContainer/ScoreLabel"

func add_point():
	score += 1
	user_interface.text = "Score: " + str(score)
