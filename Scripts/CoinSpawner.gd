extends Node2D



export var Coin = preload("res://Sehneler/Coin.tscn")
const COIN_MESAFESI = 700
onready var spawn_yer = global_position
onready var Character = get_parent().get_node("Character")



func _process(_delta):
	if spawn_yer.distance_to(Character.global_position) < 1600:
		_spawn()



func _spawn():
	var Coin_instance = Coin.instance()
	add_child(Coin_instance)
	Coin_instance.global_position.y = spawn_yer.y
	#dayaq_instance.global_position.x = spawn_yer.x
	
	
	
	spawn_yer.y = spawn_yer.y - COIN_MESAFESI 
	##pawn_yer.x = spawn_yer.x + rand_range(300,350) 
	

