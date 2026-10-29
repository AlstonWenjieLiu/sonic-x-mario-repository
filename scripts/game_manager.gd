extends Node

var score = 0
@onready var user_interface: Label = $"../UserInterface/ScoreLabel"

func add_point():
	score += 1
	user_interface.text = "Score: " + str(score)
