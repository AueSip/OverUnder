extends Node2D

@export var main_scene:Node
@onready var object = preload("res://Objects/Water_Shifter/water_shifter.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if main_scene.filling == true:
		if $Timer.is_stopped():
			$Timer.start()
		$CPUParticles2D.emitting = true
	else:
		$CPUParticles2D.emitting = false


func instance_physics():
	var physics_obj = object.instantiate()
	add_child(physics_obj)


func _on_timer_timeout():
	instance_physics()
