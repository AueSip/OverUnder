extends Control
@onready var progress_bar = $ProgressBar

@export var main_scene:Node
# Called when the node enters the scene tree for the first time.
func _ready():
	progress_bar.max_value = main_scene.max_capacity/10
	progress_bar.value = main_scene.max_capacity/10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var new_value = main_scene.current_capacity/10
	if main_scene.current_capacity != null:
		progress_bar.value = new_value

	if progress_bar.value <= 0:
		progress_bar.modulate = Color.RED
