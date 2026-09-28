extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("New Anim")
	$AnimationPlayer2.play("New Anim (2)")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer2_animation_finished(_anim_name):
	$AnimationPlayer2.stop()


func _on_AnimationPlayer_animation_finished(_anim_name):
	$AnimationPlayer.stop()
