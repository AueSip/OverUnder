extends CharacterBody2D
@export var playerMovement : PlayerMovementData
signal exited_water
@onready var animated_sprite_2d = $AnimatedSprite2D
@export var level:PackedScene
@onready var water_detector = $WaterDetector

var GRAVITY = ProjectSettings.get_setting("physics/2d/default_gravity")
var ACCELERATION
var SPEED
var FRICTION
var BUOYANCE = -60
var BUOYANTACCELERATION = 200
var in_water = false
var submerged = false
var slow_down = false
var underwater = false


func _input(event):
	if Input.is_action_just_pressed("reload_scene"):
		scene_reload()

func _physics_process(delta):
	if (not is_on_floor() && submerged == false) && in_water == false:
		velocity.y += GRAVITY * delta
	movement(delta)
	
	
	
func _ready():
	ACCELERATION = playerMovement.acceleration
	SPEED = playerMovement.speed
	FRICTION = playerMovement.friction
	
func movement(delta):
	var directionX = Input.get_action_strength("right") - Input.get_action_strength("left")
	if directionX != 0:
		velocity.x = move_toward(velocity.x, SPEED * directionX, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		
	water_movement(delta)
	upate_player_animation()
	move_and_slide()

func water_movement(delta):
	if submerged == true:
		velocity.y = move_toward(velocity.y, BUOYANCE, BUOYANTACCELERATION * delta)
	if slow_down == true:
		velocity.y = move_toward(velocity.y, 0, 800 * delta)
	
	var directionY = -1
	
	if Input.is_action_pressed("down") && in_water == true:
		velocity.y = move_toward(velocity.y, BUOYANCE * directionY, ACCELERATION * delta)
		submerged = true
		slow_down = false
		
func _on_water_detector_area_entered(water):
	submerged = true
	slow_down = false
	
func _on_water_detector_area_exited(water):
	submerged = false
	slow_down = false
	emit_signal("exited_water", water)
	
func _on_float_check_area_entered(area):
	in_water = true
	
func _on_float_check_area_exited(area):
	in_water = false
	slow_down = false
	
func _on_exited_water(water):
	submerged = false
	slow_down = true
	water_detector.set_deferred("monitoring", false)
	$WaterCheck.start()
	


func _on_water_check_timeout():
	water_detector.set_deferred("monitoring", true)


func _on_oxygen_detector_area_entered(area):
	underwater = true
	add_filter()


func _on_oxygen_detector_area_exited(area):
	underwater = false
	remove_filter()

func upate_player_animation():
	var tween = get_tree().create_tween()
	if tween != null:
		if velocity.x > 0:
			tween.tween_property(animated_sprite_2d, "rotation_degrees",animated_sprite_2d.rotation_degrees + 25, 0.01)
		if velocity.x < 0:
			tween.tween_property(animated_sprite_2d, "rotation_degrees",animated_sprite_2d.rotation_degrees - 25, 0.01)
	


func _on_progress_bar_value_changed(value):
	if value <= 0:
		scene_reload()
		
func scene_reload():
	get_tree().reload_current_scene()

func add_filter():
	Music.bus = "MusicUnder"

func remove_filter():
	Music.bus = "Music"
