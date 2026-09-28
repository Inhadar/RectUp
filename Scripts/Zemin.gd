extends StaticBody2D

onready var player = get_parent().get_parent().get_node("Character")




func _process(_delta):
	if global_position.distance_to(player.global_position)> 5000 && player.global_position.x > 5000:
		queue_free()
