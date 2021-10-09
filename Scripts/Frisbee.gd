extends Area2D


onready var obstacle_speed = rand_range(450,550)

func _ready(): 
	$AnimationPlayer.play("frisbee")

func _process(delta):
	position.x -= obstacle_speed * delta 


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()



func _on_Frisbee_body_entered(body):
	get_tree().call_group("Player", "end_game")
