extends "res://Actor/Actor.gd"

var velocity = Vector2.ZERO
var gun = default_gun.new()
onready var attackCooldown = $AttackCooldown

func _init():
	ACCELERATION = 2000
	MAX_SPEED = 400
	FRICTION = 4000

func _ready():
	self.get_parent().get_node("Healthbar").max_value = max_health
	self.get_parent().get_node("Healthbar").value = health

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
		gun._on_click($PositionMuzzle, attackCooldown, self)
	
	if Input.is_action_just_pressed("ui_switchWeapon"):
		self.get_parent().get_node("GunDisplay").switchGunDisplayed()

func take_damage(amount):
	.take_damage(amount)
	self.get_parent().get_node("Healthbar").value = health
