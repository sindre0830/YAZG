extends KinematicBody2D

const ACCELERATION = 2000
const MAX_SPEED = 400
const FRICTION = 4000

var velocity = Vector2.ZERO
export var Bullet = preload("res://Projectiles/Bullet.tscn")
onready var attackCooldown = $AttackCooldown

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	var mpos = get_global_mouse_position()
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	look_at(mpos)
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)
	
	if Input.is_action_pressed("ui_shoot") and attackCooldown.is_stopped():
		var bullet = Bullet.instance()
		owner.add_child(bullet)
		bullet.transform = $PositionMuzzle.global_transform
		attackCooldown.start()
