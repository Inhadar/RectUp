extends CanvasLayer

signal start
signal Custom
signal Exit
signal Tap
signal sound(value)

onready var Game = get_parent()


func _ready():
	$AnimationPlayer2.play("RectUp")
	#$AnimationPlayer.play("Start")
	#$Option_anim.play("Start")
	#$Custom_anim.play("Start")
	
	

func update_score(score):
	$Score.text = str(score)
func update_highscore(highscore):
	$Highscore.text = str("BEST: ",highscore)
func update_fuel(fuel):
	$Fuel.text = str(fuel)
	



func _on_Start_pressed():
	emit_signal("start")

func _on_Sound_toggled(button_pressed):
	emit_signal("sound",button_pressed)


func _on_Custom_pressed():
	emit_signal("Custom")




func _on_Exit_pressed():
	emit_signal("Exit")


func _on_Tap_pressed():
	emit_signal("Tap")


