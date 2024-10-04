extends Control
@onready var lvl_4 = $CanvasLayer/Levels/HBoxContainer/VBoxContainer/Lvl_4
@onready var lvl_2 = $CanvasLayer/Levels/HBoxContainer/VBoxContainer2/Lvl_2
@onready var lvl_5 = $CanvasLayer/Levels/HBoxContainer/VBoxContainer2/Lvl_5
@onready var lvl_3 = $CanvasLayer/Levels/HBoxContainer/VBoxContainer3/Lvl_3
@onready var lvl_6 = $CanvasLayer/Levels/HBoxContainer/VBoxContainer3/Lvl_6


@onready var play = $CanvasLayer/Play
@onready var levels = $CanvasLayer/Levels
@onready var pause_menu = $CanvasLayer/pauseMenu


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false
	if Main.level_2 == true:
		lvl_2.disabled = false
	if Main.level_3 == true:
		lvl_3.disabled = false
	if Main.level_4 == true:
		lvl_4.disabled = false
	if Main.level_5 == true:
		lvl_5.disabled = false
	if Main.level_6 == true:
		lvl_2.disabled = false
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	play.hide()
	levels.show()


func _on_settings_pressed():
	pause_menu.show()
