extends Node2D


export var Dayaq = preload("res://Sehneler/Dayaq.tscn")


var maks_dayaqlar_arasi_mesafe = 1000
var min_dayaqlar_arasi_mesafe = 850
onready var spawn_yer = global_position
onready var Character = get_parent().get_parent().get_node("Character")



func _process(_delta):
	if spawn_yer.distance_to(Character.global_position) < 2500:
		_spawn()



func _spawn():
	var dayaq_instance = Dayaq.instance()
	add_child(dayaq_instance)
	dayaq_instance.global_position.y = spawn_yer.y

	#dayaq_instance.global_position.x = spawn_yer.x
	randomize()
	
	
	spawn_yer.y = spawn_yer.y - rand_range(maks_dayaqlar_arasi_mesafe,min_dayaqlar_arasi_mesafe)
	##pawn_yer.x = spawn_yer.x + rand_range(300,350) 
	
