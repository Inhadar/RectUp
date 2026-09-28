extends Area2D


var icaze = false
var Player_icz = true
onready var Aqiz1 =  get_node("Agiz1/CollisionShape2D")
onready var Aqiz2 =  get_node("Agiz2/CollisionShape2D")


func _ready():
	pass
	

func _process(_delta):
	_disabled2()
	if icaze == true:
		$AnimationPlayer.play("Qapi_qapi")
		$AnimationPlayer2.play("Qapi_qapi")
	
func _disabled():
	Aqiz2.set_deferred("disabled",true)
	Aqiz1.set_deferred("disabled",true)
	
	
	
	
func _on_AQ_body_entered(body):
	if body.is_in_group("Player"):
		if  Player_icz == true:
			$Timer.start()
			$disable_timer.start()
			Player_icz = false 
			
func _disabled2():
			##### DÜZƏəəəELT #####
			############################################
	#if Global.Gorunmezem_bratan == true:
	#		Aqiz2.set_deferred("disabled",true)
	#		Aqiz1.set_deferred("disabled",true)
	#elif Global.Gorunmezem_bratan == false:
	#		Aqiz2.set_deferred("disabled",false)
	#		Aqiz1.set_deferred("disabled",false)
	#	################################################
	pass

func _on_Timer_timeout():
	icaze = true







func _on_AnimationPlayer_animation_finished(_anim_name):
	$AnimationPlayer.stop()
	icaze = false
			


func _on_AnimationPlayer2_animation_finished(_anim_name):
	$AnimationPlayer2.stop()
	icaze = false
			
	




func _on_disable_timer_timeout():
	_disabled()
	$disable_timer.stop()
	


func _on_AQ_body_exited(body):
	if body.is_in_group("Player"):
		_disabled()


