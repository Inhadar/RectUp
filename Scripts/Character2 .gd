extends KinematicBody2D


var fuel_bidefe =true
var player_velocity = 850
var gravity 
var get_pos = Vector2()
var noqteye_basildi_sag = true
var noqteye_basildi_sol = false
var noqteye_basildi = false
var jump_spd_max
var jump_spd_min
var jump_height_max = 1.75 * Global.UNIT_SIZE
var jump_height_min = 1 * Global.UNIT_SIZE
var jump_duration = 1
var Rocket_power = 0
onready var Game = get_parent()
onready var isiqdan_kolge = get_node("Light2D")
var yerdeyem = false
var popis_yere_deydi
const SAVE_FILE = "user://savedata.save"
var Zaman_doldu = false
var deydi = 3
onready var olum_particullari = preload("res://Sehneler/Damege_Particle.tscn")
var divardayam = false
var ziplama = 0
var Color_score = 0

var R = 1
var G = 0.231373
var B = 0.231373
#############################################################
#############################################################
#############################################################
var X = true
var Y = false
var icaze
var icaze2
var icaze_pressed
var icaze_relased
var olum_icazesi = true
var yasam_icazesi = false
var Timer_basla = false
var Timer_basla2 = false
var Goyden_Breakera = true
var zip_miqdar = 1
var cixma_deyeri = 0
var dolma_deyeri = 0
var Rocket_ses = true
var Fuel = 0





func _ready():
	gravity = 2.25 * jump_height_max /pow(jump_duration,2)
	jump_spd_max = sqrt(0.6 * gravity *jump_height_max)
	jump_spd_min = sqrt(0.6 * gravity *jump_height_min)
	
func _physics_process(delta):
	if Global.score > Global.highscore:
		Global.highscore = Global.score
		save_highscore()
		
	if icaze_pressed == true:
		$Label.text = str("SOOL")
	elif icaze_pressed == false:
		$Label.text = str("SAAG")
		
#APPLY GRAVITY
	get_pos.y += gravity * delta * 20
#DETECTOR
	if is_on_floor():
		if popis_yere_deydi == true:
			$fallen.play()
		Global.uch = false
		zip_miqdar = 1
		popis_yere_deydi  = false
		get_pos.x = 0
	else:
		yerdeyem = false
		if get_pos.y > 4500:
			Global.uch =true
	#print(get_pos.y)

#jUMP_MOVEMENT_STRUCTHUR
	if zip_miqdar   >=1  and Input.is_action_just_pressed("Space"): 
		$Fuel_timer.start()
		if Input.is_action_pressed("Space") and zip_miqdar >=1 and Global.uch == false:
			if X == true and Y == false:
				X = false
				Y = true
				icaze_pressed =true
				$Sprite.scale.x = 0.11
			elif X == false and Y== true:
				Y = false
				X = true
				icaze_pressed = false
				$Sprite.scale.x = -0.11
				
			if icaze_pressed == true:
				zip_miqdar -= 1
				get_pos.y += -jump_spd_max*20
				get_pos.x += player_velocity *2
				#$Sprite.modulate =Color(0,0,0)
			elif icaze_pressed == false:
				zip_miqdar -= 1
				get_pos.y += -jump_spd_max *20
				get_pos.x += -player_velocity *2
				#$Sprite.modulate = Color(1,1,1)
	elif Input.is_action_just_released("Space") and  (get_pos.y < -jump_spd_min):
		popis_yere_deydi = true
		$Timer.stop()
		if Global.uch == true:
			Global.uch = false
		elif Global.uch == false:
			Global.uch = true
		if yerdeyem == false: #and uch == false:
			get_pos.y = 0
		dolma_deyeri = 0
		Rocket_power = 0
		print(Global.uch)
		if $Rocket.playing == true:
			$Rocket.playing = false
	if Input.is_action_pressed("Space"):
		_rocket()
	elif Input.is_action_just_released("Space"):
		dolma_deyeri = 0
		Rocket_power = 0
	#COLOR_CHANGER_CODE


	if get_pos.y < -1000:
		Color_score +=1

	#1
	if R >= 1 and B <= 0.231373 and G <= 1:
		if Color_score == 10:
			G += 0.01
			Color_score = 0
	elif R >= 0.231373 and B == 0.231373 and  G >= 1:
		if Color_score == 10:
			R -= 0.01
			Color_score = 0
	elif R <= 0.231373 and B <= 1 and  G >= 1:
		if Color_score == 10:
			B += 0.01
			Color_score = 0
	elif R <= 0.231373 and B >= 1 and  G >= 0.231373:
		if Color_score == 10:
			G -= 0.01
			Color_score = 0
	elif R <= 1 and B >= 1 and  G <= 0.231373:
		if Color_score == 10:
			R += 0.01
			Color_score = 0
	elif R >= 1 and B >= 0.231373 and  G <= 0.231373:
		if Color_score == 10:
			B -= 0.01
			Color_score = 0
	isiqdan_kolge.color = Color(R,G,B)
	#print(Left)
	#print(Right)
	#print(divardayam)
	if olum_icazesi == false and deydi == 2:
		Global.Gorunmezem_bratan = true
			#$D_cooldown.start()
		self.modulate = Color(1, 1, 1, 0.172549)
	elif olum_icazesi == true and deydi == 2:
		self.modulate = Color(0.035294, 0.992157, 0.94902)
		Global.Gorunmezem_bratan = false
			
			
	if olum_icazesi == false and deydi == 1:
		self.modulate = Color(1, 1, 1, 0.172549)
		Global.Gorunmezem_bratan = true
		
			#$D_cooldown.start()
	elif olum_icazesi == true and deydi == 1:
			Global.Gorunmezem_bratan = false
			self.modulate =Color(0.94902, 0.913725, 0.035294)
			
			
	#print(Global.Gorunmezem_bratan)
		
	get_pos =move_and_slide(get_pos,Vector2.UP)
	
	
	
		
		
	
			
		
		
#SECURITY
	if get_pos.y > 7000 and Timer_basla == false and olum_icazesi ==  true:
		Timer_basla = true
		Goyden_Breakera = false
		#var _security = get_tree().reload_current_scene()
	if  Timer_basla == true and Timer_basla2 == false:
		$AudioStreamPlayer3.play()
		$Olum_timeri.start()
		Timer_basla2 = true
		var damege_pit_instace = olum_particullari.instance()
		damege_pit_instace.global_position = global_position
		get_tree().current_scene.add_child(damege_pit_instace)
		damege_pit_instace.modulate = Color(1, 0.011765, 0.011765)
		hide()
		get_pos.y = 0 #isteye bagli
#DEAD
	if Zaman_doldu == true:
		var _security = get_tree().reload_current_scene()
		Global.score = 0
		Global.game_over = true
		
		
		

#SAVE_SYSTEM	
	
func save_highscore():
	var save_data = File.new()
	save_data.open(SAVE_FILE,File.WRITE)
	save_data.store_var(Global.highscore)
	save_data.close()
	
func load_highscore():
	var save_data = File.new()
	if save_data.file_exists(SAVE_FILE):
		save_data.open(SAVE_FILE,File.READ)
		Global.highscore = save_data.get_var()
		save_data.close()
	
	
	
	
#Rocket
func _rocket():
	if Input.is_action_pressed("Space") and yerdeyem == false and Global.uch == true:
		dolma_deyeri += 1
		zip_miqdar = 1
		if Fuel > 0:
			cixma_deyeri += 1
		if cixma_deyeri == 10:
			Fuel -= 1
			cixma_deyeri = 0
			Game.get_node("HUD").update_fuel(Fuel)
		if Fuel > 0 and dolma_deyeri >= 1:
			if Rocket_ses == true:
				$Rocket.play()
				Rocket_ses = false
				$Rocket_timer.start()
			if Rocket_power < 4000:
				Rocket_power += 100
			get_pos.y = -Rocket_power 
			var damege_pit_instace = olum_particullari.instance()
			damege_pit_instace.global_position = global_position
			get_tree().current_scene.add_child(damege_pit_instace)
			damege_pit_instace.scale = Vector2(0.5,0.5)
			get_pos.x = 0
		elif Fuel == 0:
			if $Rocket.playing == true:
				$Rocket.playing = false
		if Fuel == 0:
			Global.uch = false
	#elif Input.is_action_just_released("Space") and yerdeyem == false and uch == true:
	#		uch = false
	#print(zip_miqdar)
	#print(uch)
	
	
	
	
	
#Olum_icazesi 




func _on_Area2D_body_entered(body):
	if body.is_in_group("Dayaqimsi"):
		if fuel_bidefe == true:
			Fuel += 1
			fuel_bidefe = false
			Game.get_node("HUD").update_fuel(Fuel)
	if body.is_in_group("AQIZ"):
		if olum_icazesi == true:
			deydi -= 1
			$D_cooldown.start()
			var damege_pit_instace = olum_particullari.instance()
			damege_pit_instace.global_position = global_position
			get_tree().current_scene.add_child(damege_pit_instace)
			if self.modulate == Color(1, 1, 1) && deydi == 2:
				self.modulate = Color(0.035294, 0.992157, 0.94902)
				$AudioStreamPlayer2.play()
			if self.modulate == Color(0.035294, 0.992157, 0.94902) && deydi == 1:
				self.modulate =Color(0.94902, 0.913725, 0.035294)
				damege_pit_instace.modulate = Color(0.94902, 0.913725, 0.035294)
				$AudioStreamPlayer2.play()
			if self.modulate ==Color(0.94902, 0.913725, 0.035294) && deydi == 0 :
				self.modulate = Color(1, 0.011765, 0.011765)
				damege_pit_instace.modulate = Color(1, 0.011765, 0.011765)
				$Olum_timeri.start()
				$AudioStreamPlayer3.play()
				hide()
			olum_icazesi= false

			
	if body.is_in_group("Alt_Zererverici"):
		if olum_icazesi == true:
			deydi -=1
			$D_cooldown.start()
			var damege_pit_instace = olum_particullari.instance()
			damege_pit_instace.global_position = global_position
			get_tree().current_scene.add_child(damege_pit_instace)
			if self.modulate == Color(1, 1, 1) && deydi == 2:
				self.modulate = Color(0.035294, 0.992157, 0.94902)
				$AudioStreamPlayer2.play()
			if self.modulate == Color(0.035294, 0.992157, 0.94902) && deydi == 1:
				self.modulate =Color(0.94902, 0.913725, 0.035294)
				damege_pit_instace.modulate = Color(0.94902, 0.913725, 0.035294)
				$AudioStreamPlayer2.play()
			if self.modulate ==Color(0.94902, 0.913725, 0.035294) && deydi == 0 :
				self.modulate = Color(1, 0.011765, 0.011765)
				damege_pit_instace.modulate = Color(1, 0.011765, 0.011765)
				$Olum_timeri.start()
				$AudioStreamPlayer3.play()
				hide()
			olum_icazesi= false

	if body.is_in_group("Breaker") and Goyden_Breakera == true:
		var damege_pit_instace = olum_particullari.instance()
		damege_pit_instace.global_position = global_position
		get_tree().current_scene.add_child(damege_pit_instace)
		self.modulate =Color(1, 0.011765, 0.011765)
		damege_pit_instace.modulate = Color(1, 0.011765, 0.011765)
		$AudioStreamPlayer3.play()
		$Olum_timeri.start()
		$D_cooldown.start()
		olum_icazesi = false
		hide()

func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.stop()


func _on_Area2D_area_entered(area):
	if area.is_in_group("Coin"):
		$AudioStreamPlayer.play()
		Global.score += 100
		Game.get_node("HUD").update_score(Global.score)
		if Global.uch == true:
			if icaze_pressed == true:
				get_pos.x += 1000
			elif icaze_pressed == false:
				get_pos.x -= 1000
	if area.is_in_group("Fuel"):
		Fuel += 20
		Game.get_node("HUD").update_fuel(Fuel)
		
		
	if area.is_in_group("DB"):
		if icaze_pressed == true:
			get_pos.x += -player_velocity *2
			X = true
			Y = false
		if icaze_pressed == false:
			get_pos.x += player_velocity *2
			X = true 
			Y = false
		#print(icaze_pressed)
func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.stop()


func _on_AudioStreamPlayer2_finished():
	$AudioStreamPlayer2.stop()


func _on_Olum_timeri_timeout():
	Zaman_doldu = true


func _on_D_cooldown_timeout():
	$D_cooldown.stop()
	olum_icazesi = true
	yasam_icazesi = false

func _on_AudioStreamPlayer3_finished():
	$AudioStreamPlayer3.stop()




func _on_Fuel_timer_timeout():
	pass # Replace with function body.


func _on_fallen_finished():
	$fallen.stop()


func _on_Rocket_timer_timeout():
	Rocket_ses = true
	$Rocket_timer.stop()


func _on_Rocket_finished():
	$Rocket.stop()


func _on_Area2D_body_exited(body):
	if body.is_in_group("Dayaqimsi"):
		fuel_bidefe = true
