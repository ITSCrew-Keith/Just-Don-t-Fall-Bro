extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -350.0
var airjump = false


@onready var animated_sprite = %PLAYER_SPRITE

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		airjump = true
		velocity += get_gravity() * delta
		animated_sprite.play("jump_start")
		
		
	if is_on_floor():
		airjump = false
	if (Input.is_key_pressed(KEY_SPACE) and is_on_floor()):
		velocity.y = JUMP_VELOCITY - (Global.coin * 13) - (Global.superjump * 500)
		if Global.superjump >= 1:
			Global.superjump = 0
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := 0
	if Input.is_key_pressed(KEY_A):
		direction = -1
	if Input.is_key_pressed(KEY_D):
		direction = 1
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	if direction == 0 and airjump == false:
		animated_sprite.play("idle")
	elif airjump == false:
		animated_sprite.play("run")
	
	move_and_slide()
	
func boucepad_jump():
	velocity.y = -1100
