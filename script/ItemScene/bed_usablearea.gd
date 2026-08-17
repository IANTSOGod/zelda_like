extends Area2D

@export var is_bed_usable: bool=false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	if is_bed_usable and Input.is_action_pressed("ui_accept"):
		print("player can sleep")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		is_bed_usable=true
		get_bed_control().visible=true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		is_bed_usable=false
		get_bed_control().visible=false

func get_bed_control()->Control:
		var scene=get_tree().current_scene.get_child(1)
		var bedscene=scene.get_child(0).get_child(5)
		var bedcontrol=bedscene.get_child(2)
		return bedcontrol
