extends Area2D

func _process(delta):
	if Input.is_action_pressed("interact"):
		$CollisionShape2D.disabled = false
		
	else:
		$CollisionShape2D.set_deferred("disabled", true) 
		
