extends Node2D



export var Coin = preload("res://Sehneler/BR.tscn")
onready var Breaker = get_parent()
var go_go = false
#onready var spawn_yer = Vector2(500,0)
onready var spawn_yer = global_position
var X_min = 200
var X_max = 900
var RocketAtmaqolar = true
onready var pozisyam = global_position
func _process(_delta):
	if go_go == true:
		if RocketAtmaqolar == true:
			_spawn()
			RocketAtmaqolar = false



func _spawn():
	var Coin_instance = Coin.instance()
	get_tree().current_scene.add_child(Coin_instance)
	Coin_instance.global_position.x = spawn_yer.x
	Coin_instance.position.y = Breaker.position.y - 1000
	#dayaq_instance.global_position.x = spawn_yer.x
	randomize()
	spawn_yer.x = rand_range(X_max,X_min)
	##pawn_yer.x = spawn_yer.x + rand_range(300,350) 
	$Timer.start()



func _on_Timer_timeout():
	RocketAtmaqolar = true
	$Timer.stop()


func _on_Baslama_timeout():
	go_go = true
