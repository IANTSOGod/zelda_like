extends Area2D

func _ready() -> void:
	pass # Replace with function body.

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var mainscene=get_tree().current_scene 
		mainscene.call_deferred("switch_lvl",2,"spawn")
