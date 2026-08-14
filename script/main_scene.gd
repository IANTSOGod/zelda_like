extends Node2D

@export var current_level:Node2D
@export var level_list=["res://script/lvl1_scene.tscn","res://script/lvl2_scene.tscn"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	switch_lvl(1,"start")
	
func switch_lvl(level:int,reason:String):
	clear_lvl()
	var level_path=level_list[level-1]
	var selected_level:PackedScene=load(level_path)
	current_level=selected_level.instantiate()
	$LevelContainer.add_child(current_level)
	find_teleporter(level,reason)
	
func find_teleporter(level:int,reason:String):
	var teleporter
	if reason=="start":
		teleporter=current_level.find_child("Lvl"+str(level)+"_start",true,false)
	else:
		teleporter=current_level.find_child("Lvl"+str(level)+"_spawn",true,false)
	if teleporter:
		$CharacterScene/CharacterBody2D.global_position=teleporter.global_position
	
func clear_lvl():
	if current_level:
		current_level.queue_free()
		current_level = null
