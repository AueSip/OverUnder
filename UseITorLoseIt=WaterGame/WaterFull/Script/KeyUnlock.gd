extends Node2D

@export var player:CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_object_area_body_entered(body):
	if body.is_in_group("Player"):
		var key_object = player.find_child("Key")
		key_object.current_keys = key_object.current_keys + 1
		print("Keys: ", key_object.current_keys)
	queue_free()
