extends Node2D

@export var current_level:Node2D
@export var level_list=[
	"res://script/lvl1_scene.tscn",
	"res://script/lvl2_scene.tscn",
	"res://script/lvl3_scene.tscn"
]
@export var house_list=[
	["res://script/Houses/lvl_1_house_1.tscn"],
	[]
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	switch_lvl(1,"start",1)
	
func switch_lvl(level:int,reason:String,teleporter_place: int):
	clear_lvl()
	var level_path=level_list[level-1]
	var selected_level:PackedScene=load(level_path)
	current_level=selected_level.instantiate()
	$LevelContainer.add_child(current_level)
	find_teleporter(level,"level",reason,teleporter_place)
	
func find_teleporter(index:int,mode:String,reason:String,teleporter_place:int):
	var teleporter
	if mode=="house":
		teleporter=current_level.find_child("house_"+str(index)+"_spawn_"+str(teleporter_place),true,false)
	else:
		if reason=="start":
			teleporter=current_level.find_child("Lvl"+str(index)+"_start",true,false)
		else:
			teleporter=current_level.find_child("Lvl"+str(index)+"_spawn_"+str(teleporter_place),true,false)
	
	if teleporter:
		$CharacterScene/CharacterBody2D.global_position=teleporter.global_position
	
func go_into_house(level:int,house_index:int):
	clear_lvl()
	var house_path=house_list[level-1][house_index-1]
	var selected_house:PackedScene=load(house_path)
	current_level=selected_house.instantiate()
	$LevelContainer.add_child(current_level)
	find_teleporter(house_index,"house","spawn",1)	
		
func clear_lvl():
	if current_level:
		current_level.queue_free()
		current_level = null
