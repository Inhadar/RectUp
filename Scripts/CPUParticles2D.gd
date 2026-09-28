extends CPUParticles2D


func _on_Timer_timeout():
	set_process(false)
	set_process_internal(false)
	set_physics_process(false)
	set_process_input(false)
	set_process_unhandled_input(false)
	set_process_unhandled_key_input(false)



func _on_Yox_olma_zamani_timeout():
	queue_free()
