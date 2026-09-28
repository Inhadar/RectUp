extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
onready var Character = get_parent().get_parent().get_parent().get_node("Character")


func _process(_delta):
	if global_position.distance_to(Character.global_position) > 2500 and Character.global_position.y  < global_position.y:
		queue_free()





#func _on_Area2D_area_entered(area):
	#if area.is_in_group("Breaker"):
	#	queue_free()


func _on_Area2D_body_entered(body):
	if body.is_in_group("Breaker"):
		queue_free()
