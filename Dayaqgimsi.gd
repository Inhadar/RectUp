extends StaticBody2D


onready var Character = get_parent().get_parent().get_parent().get_node("Character")
var ol = false
var ol2 = false
var ol3 = true
var Tmer_icaze = true
onready var Tikanlar_meydani = get_node("Tikanlar_meydani")
func _process(_delta):
	if global_position.distance_to(Character.global_position) > 2500 and Character.global_position.y  < global_position.y:
		queue_free()
		#hide()
		
	#if Input.is_action_pressed("ui_right"):
	#	rotation_degrees += 10
	#if Input.is_action_pressed("ui_left"):
	#	rotation_degrees -= 10
	
	if ol == true and Global.score >= 5000:
		if ol3 == true:
			$AnimationPlayer.play("New Anim")
			ol3 = false
			#$Tikanlar_meydani.show()
		Tikanlar_meydani.get_node("1/CollisionShape2D").set_deferred("disabled",false)
		Tikanlar_meydani.get_node("2/CollisionShape2D2").set_deferred("disabled",false)
		Tikanlar_meydani.get_node("3/CollisionShape2D3").set_deferred("disabled",false)
		Tikanlar_meydani.get_node("4/CollisionShape2D4").set_deferred("disabled",false)
		if ol2 == false:
			$Timer2.start()
			ol2 = true
	elif ol == false :
		Tikanlar_meydani.get_node("1/CollisionShape2D").set_deferred("disabled",true)
		Tikanlar_meydani.get_node("2/CollisionShape2D2").set_deferred("disabled",true)
		Tikanlar_meydani.get_node("3/CollisionShape2D3").set_deferred("disabled",true)
		Tikanlar_meydani.get_node("4/CollisionShape2D4").set_deferred("disabled",true)
	#if Global.score >= 100 and Global.score <= 20000:
	#	rotation += 0.005
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Area2D_body_entered(body):
	if body.is_in_group("Breaker"):
		#queue_free()
		pass
	if body.is_in_group("Player"):
		if Tmer_icaze == true:
			$Timer.start()
			Tmer_icaze = false



func _on_Timer_timeout():
	ol = true
	$Timer.stop()


func _on_Timer2_timeout():
	ol = false


func _on_AnimationPlayer_animation_finished(_anim_name):
	$AnimationPlayer.stop()


func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		ol3 = false
		
