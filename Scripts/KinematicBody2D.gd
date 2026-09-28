extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
var Breaker_spd = 650
var Breaker_pos = Vector2()
var A= 1
var Color_score = 0
var ishle = true
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("New Anim")
	$SagD.play("Sag")
	$SolD.play("Sol")
func _physics_process(delta):
	Breaker_pos.y -= 1
	Breaker_pos = Breaker_pos.normalized() * Breaker_spd 
	#print(Breaker_spd)
	var _elebele  = move_and_collide(Breaker_pos * delta)
	#print(Color_score)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	if ishle == false:
		Breaker_spd -= 0.01
		Color_score -= 0.1
#1
	#if Color_score >= 2:
	#	Color_score = 0
	#	A -= 0.01 
	#	$Sprite.modulate = Color(A,A,A) 
	#print(A)
	#print(Color_score)
	#	if Color_score == 10:
	#		G += 0.01
	#elif R >= 0.231373 and B == 0.231373 and  G >= 1:
	#	if Color_score == 50:
	#		R -= 0.01
	#elif R <= 0.231373 and B <= 1 and  G >= 1:
	#	if Color_score == 100:
	#		B += 0.01
	#elif R <= 0.231373 and B >= 1 and  G >= 0.231373:
	#	if Color_score == 150:
	#		G -= 0.01
	#elif R <= 1 and B >= 1 and  G <= 0.231373:
	#	if Color_score == 200:
	#		R += 0.01
	#elif R >= 1 and B >= 0.231373 and  G <= 0.231373:
	#	if Color_score == 250:
	#		B -= 0.01
	#self.modulate = Color(R,G,B)






func _on_mede_area_entered(area):
	if area.is_in_group("Coin"):
		ishle = true
		$AudioStreamPlayer.play()
		$yeyiremm.start()
		Breaker_spd += 1
		Color_score += 2
	



func _on_yeyiremm_timeout():
	ishle = false
	$yeyiremm.stop()


func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.stop()
