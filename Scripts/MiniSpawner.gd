extends Node2D

var spawnolundu = false
export var dayaq = preload("res://Sehneler/Dayaq.tscn")


func _process(_delta):
	if spawnolundu == false:
		var dayaq_istance = dayaq.instance()
		dayaq_istance.global_position = global_position
		add_child(dayaq_istance)
		while true:
			if spawnolundu == false:
				spawnolundu = true
			else:
				break
