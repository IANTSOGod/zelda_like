extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var dooranimation=get_door_animation()
		dooranimation.play("open")
		if not dooranimation.animation_finished.is_connected(post_animation):
			dooranimation.animation_finished.connect(post_animation, CONNECT_ONE_SHOT)


func get_door_animation()->AnimatedSprite2D:
	var mainscene=get_tree().current_scene
	var containerscene=mainscene.get_child(1)
	var levelscene=containerscene.get_child(0)
	var dooranimation=levelscene.get_child(5).get_child(0).get_child(0)
	return dooranimation
	
func post_animation():
	var mainscene=get_tree().current_scene
	mainscene.call_deferred("go_into_house",1,1)
	
