extends Area2D



const speed=100

func _process(delta):
	position+=transform.x*speed*delta
	$AnimationPlayer.play("Bullet")

func _on_Timer_timeout():
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()





func _on_Bullet_body_entered(body):
	if body.name=="Player":
		body._death=true
		$SfxrStreamPlayer.play()
		$CPUParticles2D.emitting=true
		yield(get_tree().create_timer(1),"timeout")
		get_tree().reload_current_scene()
