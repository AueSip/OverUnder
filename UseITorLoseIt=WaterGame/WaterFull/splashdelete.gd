extends Node

@onready var splash = $".."

# Called when the node enters the scene tree for the first time.



func _on_splash_finished():
	splash.queue_free()
