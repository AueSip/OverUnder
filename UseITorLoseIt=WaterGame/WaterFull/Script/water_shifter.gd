extends CharacterBody2D

var GRAVITY = 100


func _ready():
	$Timer.start()

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta
		
		
		move_and_slide()
	



func _on_timer_timeout():
	queue_free()
