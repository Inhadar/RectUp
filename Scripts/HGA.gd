extends Area2D

onready var mermi = preload("res://Sehneler/mermi.tscn")
onready var Dyqms = get_parent()
var cum = false
var isle = true
var tek_seferlik_sevgi = true
var tek_seferlik_sevgi2 = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(_delta):
	if cum == true:
	#if Input.is_action_just_pressed("ui_select"):
		var mermi_instance = mermi.instance()
		mermi_instance.position = $Position2D.global_position
		mermi_instance.rotation_degrees = Dyqms.rotation_degrees +90
		mermi_instance.apply_impulse(Vector2(),Vector2(2000,0).rotated(Dyqms.rotation))
		get_tree().get_root().add_child(mermi_instance)
		cum = false
		
	if Global.score > 10000 and isle == true:
		self.show()
		$CollisionShape2D.set_deferred("disabled",false)
		isle = false
	elif Global.score < 10000 and isle == true:
		self.hide()
		$CollisionShape2D.set_deferred("disabled",true)

		
		
#get_tree().current_scene.add_child(mermi_instance)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	#if Input.is_action_pressed("ui_right"):
	#	rotation_degrees += 10
	#	
	#elif Input.is_action_pressed("ui_left"):
	#	rotation_degrees -= 10
		
		#yield(get_tree().create_timer(0.3),"timeout")
		#cum = true
	if tek_seferlik_sevgi == false:
		if tek_seferlik_sevgi2 == true:
			yield(get_tree().create_timer(0.5),"timeout")
			$Sprite2.hide()
			$CollisionShape2D.set_deferred("disabled",true)
			tek_seferlik_sevgi2 = false




func _on_HGA_body_entered(body):
	if body.is_in_group("Player"):
		if tek_seferlik_sevgi == true:
			cum =true
			tek_seferlik_sevgi =false
