extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var Adam =get_tree().get_current_scene().get_node("Character")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _physics_process(_delta):
	if global_position.distance_to(Adam.global_position) > 1600 and Adam.global_position.y < global_position.y:
		queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DAyaqciq_anim_animation_finished(_anim_name):
	$DAyaqciq_anim.stop()


func _on_GDT_body_entered(body):
	if body.is_in_group("Player"):
		$DAyaqciq_anim.play("dayaqciq")
		$CollisionShape2D.set_deferred("disabled",true)
		$CollisionShape2D2.set_deferred("disabled",true)
		
