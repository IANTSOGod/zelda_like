extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	
	var direction=Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	if Input.is_action_pressed("ui_right"):
		$character_animation.play("walk_right")
	elif Input.is_action_pressed("ui_left"):
		$character_animation.play("walk_left")
	elif Input.is_action_pressed("ui_up"):
		$character_animation.play("walk_up")
	elif Input.is_action_pressed("ui_down"):
		$character_animation.play("walk_down")
	else:
		$character_animation.play("idle")	
		
	if direction.x!=0 and direction.y!=0:
		pass
	else:
		velocity=direction*SPEED
	move_and_slide()
