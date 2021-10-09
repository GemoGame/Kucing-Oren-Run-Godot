extends KinematicBody2D

const gravity = 20 
const jump_speed = -700
var velocity = Vector2.ZERO

func _process(delta):
	velocity.y += gravity
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
		#$AudioStreamPlayer.play()
	
	
	if is_on_floor(): 
		$AnimationPlayer.play("walk")
	else: 
		$AnimationPlayer.play("jump")
	
	move_and_slide(velocity,Vector2.UP)

func end_game(): 
	get_tree().change_scene("res://Scene/TitleScreen.tscn")
