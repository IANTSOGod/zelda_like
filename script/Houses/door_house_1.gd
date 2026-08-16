extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var mainscene=get_tree().current_scene
		var containerscene=mainscene.get_child(1)
		var levelscene=containerscene.get_child(0)
		var dooranimation=levelscene.get_child(5).get_child(0).get_child(0)
		dooranimation.play("open")
		#add a timer here before entering the house
		mainscene.call_deferred("go_into_house",1,1)
		
