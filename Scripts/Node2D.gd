extends Node2D



export var Divar = preload("res://Sehneler/Divar.tscn")
const DIVAR_MESAFESI = 64
onready var spawn_yer = global_position
onready var Character = get_parent().get_node("Character")



func _process(_delta):
	if spawn_yer.distance_to(Character.global_position) < 1600:
		_spawn()



func _spawn():
	var divar_instance = Divar.instance()
	add_child(divar_instance)
	divar_instance.global_position.y = spawn_yer.y
	#dayaq_instance.global_position.x = spawn_yer.x
	
	
	
	spawn_yer.y = spawn_yer.y - DIVAR_MESAFESI 
	##pawn_yer.x = spawn_yer.x + rand_range(300,350) 
	
