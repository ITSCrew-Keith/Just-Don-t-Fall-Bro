extends CharacterBody2D

#varibles
var SPEED = 200
const JUMP_VELOCITY = -350.0
var direction := 0

@onready var animated_sprite = %PLAYER_SPRITE

func _physics_process(delta: float) -> void:
	print(Global.doublejump)
	#bossfling R player mechanic
	if(Global.bossflingR == true):
		velocity.y = -100
		Global.bossflingtimer -= 1
		print(Global.bossflingtimer)
		if(Global.bossflingtimer == 0):
			Global.bossflingR = false
	#bossfling L player mechanic
	if(Global.bossflingL == true):
		velocity.y = -100
		Global.bossflingtimer -= 1
		print(Global.bossflingtimer)
		if(Global.bossflingtimer == 0):
			Global.bossflingL = false

	#adds gravity and makes player animation work under gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated_sprite.play("jump_start")

	#adds jumping and handles superjump
	if Input.is_action_just_pressed("jump"):
		if (is_on_floor() or Global.doublejump >= 1):
			velocity.y = JUMP_VELOCITY - (Global.coin * 13) - (Global.superjump * 500)
		if Global.superjump >= 1:
			Global.superjump = 0
		if Global.doublejump > 0:
			Global.doublejump -= 1


	# sets direction to 0 if no x-axis action is happening/handles bossflings
	var direction := 0
	if (Global.bossflingR == true):
		direction = 5
	if (Global.bossflingL == true):
		direction = -5
		
	#handles left and right movement using keys
	if Input.is_key_pressed(KEY_A) and Global.bossflingR == false:
		direction = -1
	if Input.is_key_pressed(KEY_D) and Global.bossflingR == false:
		direction = 1
	if Input.is_key_pressed(KEY_P) and Global.bossflingR == false:
		Global.checkpoint = 5
	#handles direction and how it effects speed
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	
	# handles animation based on direction
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	# handles idle and running animations
	if direction == 0 and is_on_floor():
		animated_sprite.play("idle")
	elif is_on_floor():
		animated_sprite.play("run")
	
	#handles all movement related things
	move_and_slide()
	
	#runs deathstate code if its true
	if Global.deathState == true:
		deathManager()
	
	#handles bouncepad jumps
func boucepad_jump():
	velocity.y = -1100 - (Global.coin * 20)
	
	
	#manages checkpoint placement after death
func deathManager():
	if Global.checkpoint == 0:
		position.x = -5
		position.y = -10
		Global.deathState = false
	if Global.checkpoint == 1:
		position.x = -5
		position.y = -1050
		Global.deathState = false
	if Global.checkpoint == 2:
		position.x = -5
		position.y = -2020
		Global.deathState = false
	if Global.checkpoint == 3:
		position.x = -5
		position.y = -3050
		Global.deathState = false
	if Global.checkpoint == 4:
		position.x = -5
		position.y = -4450
		Global.deathState = false
	if Global.checkpoint == 5:
		position.x = -5
		position.y = -5430
		Global.deathState = false
