extends Node2D





export var Divar = preload("res://Sehneler/Dayaqgimsi.tscn")
const DIVAR_MESAFESI = 64
var max_y = -400
var min_y = 50
var max_x = 1080
var min_x = 780
var spawn_deyeri = 0
var icaze = true
var scale_deyer = 0
var R
var G
var B
onready var spawn_yer = global_position
onready var Character = get_parent().get_parent().get_node("Character")



func _process(_delta):
	if spawn_yer.distance_to(Character.global_position) < 3000:
		if spawn_deyeri <= 1 and icaze == true:
			_spawn()
		if spawn_deyeri >= 1:
			icaze = false
		if icaze == false:
			spawn_yer.y -= 1100
			spawn_deyeri = 0
			icaze = true
		


func _spawn():
	spawn_deyeri += 1 
	var divar_instance = Divar.instance()
	add_child(divar_instance)
	divar_instance.global_position.y = spawn_yer.y - rand_range(-50,200)
	divar_instance.global_position.x = spawn_yer.x - rand_range(0,80)
	#dayaq_instance.global_position.x = spawn_yer.x
	
	
	randomize()
	
	
	
	
	scale_deyer = rand_range(3,7)
	divar_instance.scale.x = scale_deyer
	divar_instance.scale.y = scale_deyer
	
	#spawn_yer.y = spawn_yer.y + rand_range(min_y,max_y) 
	#spawn_yer.x = rand_range(min_x,max_x)
	#divar_instance.scale.x = rand_range(4,5)
	#divar_instance.scale.y = rand_range(4,5)
	divar_instance.rotation_degrees = rand_range(0,45)
	##pawn_yer.x = spawn_yer.x + rand_range(300,350) 
	#R = rand_range(0.5,1)
	#G = rand_range(0.5,1)
	#B = rand_range(0.5,1)
	#divar_instance.modulate = Color(R,G,B)
	

