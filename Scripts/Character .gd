extends KinematicBody2D

var player_velocity = 300
const jUMP_HEIGHT = 1000
const GRAVITY = 20
var yerdeyem = false
var get_pos = Vector2()
var noqteye_basildi_sag = true
var noqteye_basildi_sol = false
var noqteye_basildi = false
var icaze = false

func _process(_delta):
	
#GRAVITY DETECTOR
	if is_on_floor():
		yerdeyem = true
		get_pos.x = 0
		icaze = true
		
	else:
		icaze = false
		yerdeyem = false

#jUMP_MOVEMENT
	if Input.is_action_pressed("ui_select") && yerdeyem == true:
		#if noqteye_basildi == true:
		get_pos.y += - jUMP_HEIGHT
	elif Input.is_action_just_released("ui_select") && get_pos.y < 0:
		get_pos.y = 0
	else:
		get_pos.y += GRAVITY
	
	
	
#SAG VE SOL ZİPLAMA
	if Input.is_action_just_pressed("ui_select") && icaze == true:
		if noqteye_basildi_sag == true:
			noqteye_basildi = true
			get_pos.x += 300
		elif noqteye_basildi_sol == true:
			get_pos.x += -300
#SAG VE SOL HEREKET 


	
	get_pos = move_and_slide(get_pos,Vector2.UP)


#SECURITY
	if get_pos.y > 3000:
		var _security = get_tree().reload_current_scene()

#ZIPLAMA QERAR VERICISI
func _on_Timer_timeout():
	if noqteye_basildi_sag == false:
		noqteye_basildi_sol = false
		noqteye_basildi_sag = true
		$Sprite.modulate = Color(1, 0, 0)
	elif noqteye_basildi_sol == false:
		noqteye_basildi_sag = false
		noqteye_basildi_sol = true
		$Sprite.modulate = Color(0.921569, 1, 0)
