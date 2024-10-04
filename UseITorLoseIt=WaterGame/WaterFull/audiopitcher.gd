extends AudioStreamPlayer2D

@export var pitch1 = float(1)
@export var pitch2 = float(1)
var timing = false
var timer = Timer.new()
var pitch_random
var last_pitch = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pitch_change()
	play()
# Called every frame. 'delta' is the elapsed time since the previous frame.

		
func pitch_change():
	pitch_scale = randf_range(pitch1, pitch2)
		
	
		
		


