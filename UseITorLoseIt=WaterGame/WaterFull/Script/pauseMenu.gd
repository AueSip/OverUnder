extends Control


func _ready():
	window_mode_change()

func _on_button_pressed():
	get_tree().paused = false
	hide()

func _input(event):
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = !get_tree().paused
		visible = !visible


func _on_quit_pressed():
	get_tree().quit()


func _on_window_pressed():
	Main.window_mode = !Main.window_mode
	window_mode_change()

func window_mode_change():
	if Main.window_mode:
		$Window.text = "Fullscreen"
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	if !Main.window_mode:
		$Window.text = "Windowed"
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
