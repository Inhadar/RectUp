extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Yer = Vector2()
const BRSPD = 5000
var gozle = true
#var icaze = true
onready var Rocket_particullari = preload("res://Sehneler/Damege_Particle.tscn")
onready var Character = get_tree().get_current_scene().get_node("Character")
# Called when the node enters the scene tree for the first time.
#onready var spwnyer = global_position

func _ready():
	if gozle == true:
		$"Rocket gozle".start()
	$BRisaresi.start()
	$Sprite2/Belirleyici.play("belirleyici")
		

func _physics_process(delta):
	
	if global_position.distance_to(Character.global_position) > 1600 and Character.global_position.y  > global_position.y:
		queue_free()
		print("silindi")
	
	
	if gozle == false:
		self.position.y += -BRSPD * delta
	var Rocket_particullari_instc = Rocket_particullari.instance()
	Rocket_particullari_instc.global_position = global_position
	#get_parent().get_parent().get_parent().get_node("Character").get_node("ParallaxBackground").add_child(Rocket_particullari_instc)
	get_tree().current_scene.add_child(Rocket_particullari_instc)
	Rocket_particullari_instc.modulate = Color(1, 0.4, 0)
	
	


func _on_BR_isaresi_timeout():
	#$Sprite2.hide()
	$Sprite2.queue_free()
	$BRisaresi.stop()
	


# warning-ignore:unused_argument
func _on_Belirleyici_animation_finished(_anim_name):
	$Sprite2/Belirleyici.stop()


func _on_Rocket_gozle_timeout():
	gozle = false
	$Roket.play("Rkthereket")
	$"Rocket gozle".stop()


func _on_Roket_animation_finished(_anim_name):
	$Roket.stop()


func _on_BR_body_entered(body):
	if body.is_in_group("Player"):
		queue_free()
