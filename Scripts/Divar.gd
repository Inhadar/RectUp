extends StaticBody2D


onready var Character = get_parent().get_parent().get_parent().get_node("Character")


func _process(_delta):
	if global_position.distance_to(Character.global_position) > 2500 and Character.global_position.y  < global_position.y:
		queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Area2D_body_entered(body):
	if body.is_in_group("Breaker"):
		#queue_free()
		pass
