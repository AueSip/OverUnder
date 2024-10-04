extends Node2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@export var Main:Node
var active = false
var working_state = true

func _ready():
	animated_sprite_2d.pause()

func _on_interact_detector_area_entered(area):
	active = true
	animated_sprite_2d.play()
	print(active)
	if Main != null:
		Main.filling = true

func _input(event):
	if Input.is_action_just_pressed("space") && active == true && working_state == true:
		$CPUParticles2D.emitting = true
		animated_sprite_2d.play("Broken")
		$InteractDetector.set_deferred("monitoring", false)
		if Main != null:
			Main.filling = false
		working_state = false
	
