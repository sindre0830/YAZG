extends "res://Actor/Actor.gd"

var HEALTHBAR = "UI/Healthbar"
var GUNDISPLAY = "UI/GunDisplay"
var DIFFICULTY = "UI/Difficulty/Label2"

export var FragGrenade = preload("res://Throwables/FragGrenade.tscn")

onready var guns = [$"Guns/Mini-Gun", $Guns/Handgun]
onready var gun_index = 0
onready var gun = guns[gun_index]
onready var time_start

var diff = 1

func _init():
	ACCELERATION = 2000
	MAX_SPEED = 400
	FRICTION = 4000


func _ready():
	self.get_node(HEALTHBAR).max_value = max_health
	self.get_node(HEALTHBAR).value = PlayerValues.current_health
	health = PlayerValues.current_health
	self.get_node(DIFFICULTY).text = str(floor(PlayerValues.current_difficulty))

	time_start = OS.get_unix_time()
	get_node("UI/MiniMap").updateMinimap()		# Get current minimap
	
	
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
	
	if Input.is_action_pressed("ui_shoot") and gun.get_child(0).is_stopped():
		gun.shoot($PositionMuzzle, self)
		
	if Input.is_action_pressed("ui_special_attack") and self.get_node("Throwables/GrenadeCooldown").is_stopped():
			var grenade = FragGrenade.instance()
			grenade.init(self.position, get_global_mouse_position(), self.rotation)
			grenade.transform =  self.global_transform 
			self.owner.add_child(grenade)
			self.get_node("Throwables/GrenadeCooldown").start()

	if Input.is_action_just_pressed("ui_switchWeapon"):
		self.get_node(GUNDISPLAY).switchGunDisplayed()
		gun_index += 1
		if gun_index >= guns.size():
			gun_index = 0
		gun = guns[gun_index]

func take_damage(amount):
	.take_damage(amount)
	PlayerValues.current_health = health
	self.get_node(HEALTHBAR).value = health
	

func die():
	# TODO: send timer to death screen
	PlayerValues.time_end = OS.get_unix_time()
	assert(get_tree().change_scene("res://Menu/DeathScreen.tscn") == OK)
	
func increase_diff():
	PlayerValues.current_difficulty += 0.2
	self.get_node(DIFFICULTY).text = str(floor(PlayerValues.current_difficulty))
