extends ProgressBar
@onready var character_body_2d = $".."

@export var oxygen_max = 300
var oxygen
# Called when the node enters the scene tree for the first time.
func _ready():
	oxygen = oxygen_max
	max_value = oxygen_max
	value = oxygen_max

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if character_body_2d.underwater == true:
		show()
		if $OxygenTimer.is_stopped():
			$OxygenTimer.start()
	if character_body_2d.underwater == false:
		hide()
		$OxygenTimer.stop()
		value = oxygen
	
	
func _on_oxygen_timer_timeout():
	if value >= 10:
		value -= 10
	print(value)
