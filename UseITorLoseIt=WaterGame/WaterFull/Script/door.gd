extends Node2D
@onready var door_sprite = $DoorSprite
@export var scene:Node
@export var player:CharacterBody2D

@export var required_keys:int

func _ready():
	door_sprite.texture.region = Rect2(0, 32, 32, 32)

func _process(delta):
	if player != null:
		var key_check = player.find_child("Key")
		var keys = key_check.current_keys
		if keys >= required_keys:
			door_sprite.texture.region = Rect2(0, 64, 32, 32)
			$Area2D.monitoring = true
			

func _on_area_2d_body_entered(body):
	if player != null:
		scene.menu_open()
		
