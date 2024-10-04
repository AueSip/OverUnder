extends Node2D
@export var level_name:String
@onready var water_body = $Water_body
@onready var time = $time
var emptying = false
var filling = false
var disabled = false
const min_capacity:int = 0
var current_capacity:int = 0
@export var max_capacity:int
@onready var draincapacity = $draincapacity

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false
	current_capacity = max_capacity
	
	if level_name == "level_2":
		Main.level_2 = true
	if level_name == "level_3":
		Main.level_3 = true
	if level_name == "level_4":
		Main.level_4 = true
	if level_name == "level_5":
		Main.level_5 = true
	if level_name == "level_6":
		Main.level_6 = true



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if filling == true &&  disabled == false && time.is_stopped():
		time.start()
	if emptying == true && time.is_stopped():
		time.start()
		
	if current_capacity <= min_capacity:
		disabled = true
		filling = false
		current_capacity = min_capacity
	
	filling_water()
		
func _on_time_timeout():
	filling_level()
	emptying_level()
	
func filling_level():
	var tween = get_tree().create_tween()
	if filling == true && emptying == false:
		var desired_position = water_body.global_position.y - 10
		tween.tween_property(water_body, "global_position",Vector2(water_body.global_position.x,desired_position), 0.5)

func emptying_level():
	var tween = get_tree().create_tween()
	if emptying == true && water_body.global_position <= Vector2(0,264):
		var desired_position = water_body.global_position.y + 10
		tween.tween_property(water_body, "global_position",Vector2(water_body.global_position.x,desired_position), 0.5)
		
func filling_water():
	if filling == true && draincapacity.is_stopped():
		draincapacity.start()
			

func _on_draincapacity_timeout():
	current_capacity = current_capacity - 10
	
func menu_open():
	$CanvasLayer/Control.show()
	get_tree().paused = true
