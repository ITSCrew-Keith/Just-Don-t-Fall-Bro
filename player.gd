extends CharacterBody2D


@export var Speed : float = 185.0
@export var Jump_Velocity : float = -260.0
@export var Double_Jump_Velocity : float = -200.0

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

var has_double_jumped : bool = false
var animation_locked : bool = false
var direction : Vector2 = Vector2.ZERO
var was_in_air : bool = false


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		was_in_air = true
	else:
		has_double_jumped = false
		
		if was_in_air == true:
			land()
			was_in_air = false
	
	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			#Normal Jump from floor
			jump()
		elif not has_double_jumped:
			#double jump in air
			double_jump()

	direction = Input.get_vector("left", "right", "up", "down")

	if direction.x != 0 && animated_sprite.animation != "jump_end":
		velocity.x = direction.x * Speed
	else:
		velocity.x = move_toward(velocity.x, 0, Speed)
	
	move_and_slide()
	update_animation()
	update_facing_direction()
func update_animation():
	if not animation_locked:
		if not is_on_floor():
			animated_sprite.play("jump_loop")
		else:
			if direction.x != 0:
				animated_sprite.play("run")
			else:
				animated_sprite.play("idle")
			
func update_facing_direction():
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true
	
func jump():
	velocity.y = Jump_Velocity
	animated_sprite.play("jump_start")
	animation_locked = true
	
func double_jump():
	velocity.y = Double_Jump_Velocity
	animated_sprite.play("jump_double")
	animation_locked = true
	has_double_jumped = true
	
func land():
	animated_sprite.play("jump_end")
	animation_locked = true



func _on_animated_sprite_2d_animation_finished():
	if(["jump_end", "jump_start", "jump_double"].has(animated_sprite.animation)):
		animation_locked = false
