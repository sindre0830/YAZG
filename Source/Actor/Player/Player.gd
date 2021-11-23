extends "res://Actor/Actor.gd"

var HEALTHBAR = "UI/Healthbar"
var GUNDISPLAY = "UI/GunDisplay"
var DIFFICULTY = "UI/Difficulty/Label2"
var XPShow = "UI/XPDisplay/Label"


var MolotovCocktail = preload("res://Throwables/MolotovCocktail.tscn")
var FragGrenade = preload("res://Throwables/FragGrenade.tscn")

onready var guns = [$"Guns/Mini-Gun", $Guns/Handgun]
onready var gun_index = 0
onready var gun = guns[gun_index]
onready var time_start
onready var hazard = 0			# Tracks whether player is taking damage from hazard
var grenade

var diff = 1

func _init():
	ACCELERATION = 2000
	MAX_SPEED = 400
	ORIG_SPEED = 400
	FRICTION = 4000
	


func _ready():
	self.get_node(HEALTHBAR).max_value = max_health
	self.get_node(HEALTHBAR).value = PlayerValues.current_health
	health = PlayerValues.current_health
	self.get_node(DIFFICULTY).text = str(floor(PlayerValues.current_difficulty))
	self.get_node(XPShow).text = str(PlayerValues.current_XP)

	time_start = OS.get_unix_time()
	get_node("UI/MiniMap").updateMinimap()		# Get current minimap
	#set inventory
	$UI/Inventory.set_inventory()

	
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_pause"):
		toggle_pause()
		get_tree().paused = PlayerValues.flagPaused
		$UI/Inventory.visible = PlayerValues.flagPaused
	
	if PlayerValues.flagPaused:
		return

	var input_vector = Vector2.ZERO
	var mpos = get_global_mouse_position()
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	look_at(mpos)

	if input_vector != Vector2.ZERO:
		# Calculate angle between the velocity vector and the direction the
		# player is looking towards
		var angle_facing_movement = acos(
			(self.transform.x.dot(input_vector) / 
			(self.transform.x.length() * input_vector.length())
		))
		
		var speed_multiplier = 1.0
		
		# If the player is moving backwards reduce their speed
		if angle_facing_movement > PI/2:
			speed_multiplier = (1.5 - angle_facing_movement / PI)

		# Calculate actual velocity
		velocity = velocity.move_toward(
			input_vector * speed_multiplier * MAX_SPEED, 
			ACCELERATION * delta
		)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)
	
	if Input.is_action_pressed("ui_shoot") and gun.get_child(0).is_stopped():
		gun.shoot($PositionMuzzle, self)
		
	if (Input.is_action_pressed("ui_special_attack") and PlayerValues.toolbar.size() >= 3):
		if PlayerValues.toolbar[2] == PlayerValues.MOLOTOV_COCKTAIL:
			grenade = MolotovCocktail.instance()
		elif PlayerValues.toolbar[2] == PlayerValues.FRAG_GRENADE:
			grenade = FragGrenade.instance()
		grenade.init(self.position, get_global_mouse_position(), self.rotation)
		grenade.transform =  self.global_transform 
		self.owner.add_child(grenade)
		PlayerValues.toolbar.pop_back()
		
		# Update inventory
		$UI/Inventory.set_inventory()

	if Input.is_action_just_pressed("ui_switchWeapon"):
		self.get_node(GUNDISPLAY).switchGunDisplayed()
		gun_index += 1
		if gun_index >= guns.size():
			gun_index = 0
		gun = guns[gun_index]
		# fix toolbar position
		var buffer = PlayerValues.toolbar[0]
		PlayerValues.toolbar[0] = PlayerValues.toolbar[1]
		PlayerValues.toolbar[1] = buffer
		$UI/Inventory.set_inventory()
	# Check if in hazardous area
	if hazard != 0:
		take_damage(delta * hazard)


func take_damage(amount):
	.take_damage(amount)
	PlayerValues.current_health = health
	self.get_node(HEALTHBAR).value = health
	

func die():
	# TODO: send timer to death screen
	PlayerValues.time_end = OS.get_unix_time() - time_start
	assert(get_tree().change_scene("res://Menu/DeathScreen.tscn") == OK)
	
func increase_diff():
	PlayerValues.current_difficulty += 0.2
	self.get_node(DIFFICULTY).text = str(floor(PlayerValues.current_difficulty))

func toggle_pause():
	PlayerValues.flagPaused = !PlayerValues.flagPaused

func take_xp(amount):
	PlayerValues.current_XP += amount
	self.get_node(XPShow).text = str(PlayerValues.current_XP)
	
