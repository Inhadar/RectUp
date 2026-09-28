extends Node


var score  = 0
var bisey = false
var bisey2 = true
var bisey3 = false


func _ready():
	get_tree().paused = true
	if Global.game_over == true:
		$HUD/Start.show()
		$HUD/ColorRect.show()
		$HUD/Highscore.show()
		$HUD/Highscore2.show()
		$HUD/Highscore3.show()
		$HUD/Sprite2.show()
		$HUD/Sprite3.show()
		$HUD/Sprite4.show()
		$HUD/Sprite5.hide()
		$HUD/Custom.show()
		$HUD/Exit.show()
		$Character.load_highscore()
		$HUD.update_highscore(Global.highscore)
		$HUD/Sound.show()
		$AudioStreamPlayer.play()
		
		
		if Global.music_mute == false:
			$HUD/Sound.pressed = false
		elif Global.music_mute == true:
			$HUD/Sound.pressed =true

			
		#$AudioStreamPlayer.stop()

func _on_HUD_start():
	Global.Gorunmezem_bratan = false
	Global.game_over = false
	if Global.game_over == false:
		
		$HUD/Sprite2.hide()
		$HUD/Sprite3.hide()
		$HUD/Sprite4.hide()
		$HUD/Sprite5.show()
		$HUD/Start.hide()
		$HUD/ColorRect.hide()
		$HUD/Highscore.hide()
		$HUD/Highscore2.hide()
		$HUD/Highscore3.hide()
		$HUD/Custom.hide()
		$HUD/Exit.hide()
		$HUD/Sprite.hide()
		$HUD/Sound.hide()
		$HUD/ColorRect2.show()
		$HUD/Tap.show()
		$HUD/Tap_yazi.show()

func _on_HUD_options():
	pass # Replace with function body.


func _on_HUD_Custom():
	pass # Replace with function body.


func _on_AudioStreamPlayer_finished():
	pass


func _on_HUD_sound(value):
	Global.music_mute = value
	var idx = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_mute(idx,Global.music_mute)


func _on_HUD_Tap():
	get_tree().paused = false
	$HUD/Touch.show()
	$HUD/ColorRect2.hide()
	$HUD/Tap.hide()
	$HUD/Tap_yazi.hide()
	$HUD/Tap_yazi.hide()








func _on_HUD_Exit():
	get_tree().quit()
