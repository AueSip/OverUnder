extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@export var Main:Node
var active = false


func _process(delta):
	update_animation()
	



func _input(event):
	if Input.is_action_just_pressed("shift"):
		active = !active
		print(active)
		if Main != null:
			drain()
func update_animation():
	if active:
		animated_sprite_2d.play("Open")
		
	else:
		animated_sprite_2d.play("Closed")

func drain():
	if Main != null:
			if Main.emptying == false && active == true:
				Main.emptying = true
			elif Main.emptying == true && active == false:
				Main.emptying = false
