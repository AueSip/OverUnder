extends Node2D
var splash_sound = preload("res://Music/splash.tscn")
var velocity = 0
var force = 0
var height = 0
var target_height = 0
var index = 0

var motion_factor = 0.02

var collided_with = null

signal splash
@onready var collision = $Area2D/CollisionShape2D

# Called when the node enters the scene tree for the first time.
func water_update(spring_constant, dampening):
	height = position.y
	var x = height - target_height
	
	var loss = -dampening * velocity
	
	force = -spring_constant * x + loss
	
	velocity += force
	
	position.y += velocity
	pass
	

	
func initialize(x_position, id):
	height = position.y
	target_height = position.y
	velocity = 0
	position.x = x_position
	index = id
func set_collision_width(value):
	collision.shape.size = Vector2(value, collision.shape.size.y)
	


func _on_area_2d_body_entered(body):
	var speed = body.velocity.y/2 * motion_factor
	if speed != 0:
		$CPUParticles2D.emitting = true
		if body.is_in_group("Player"):
			var splash = splash_sound.instantiate()
			add_child(splash)
	emit_signal("splash",index,speed)
	
