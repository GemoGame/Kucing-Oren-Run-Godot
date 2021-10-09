extends Node

const OBSTACLE = preload("res://Scene/Trash.tscn")
const TRASH = preload("res://Scene/Trash.tscn")
const FRISBEE = preload("res://Scene/Frisbee.tscn")



func _ready():
	Global.current_score = 0
	

var obstacle_list = ["trash","frisbee"]

func _on_Timer_timeout():
	randomize()
	var current_obstacle = obstacle_list[randi() % obstacle_list.size()]
	$Timer.wait_time = rand_range(1,3)
	
	if current_obstacle == "trash" : 
		var trash = TRASH.instance()
		add_child(trash)
		
	if current_obstacle == "frisbee" : 
		var frisbee = FRISBEE.instance()
		add_child(frisbee)


func _on_ScoreTimer_timeout():
	Global.current_score += 1
	

func _process(delta):
	$score.text = "score: " + str(Global.current_score)
