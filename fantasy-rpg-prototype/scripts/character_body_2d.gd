extends CharacterBody2D


const SPEED = 300.0
var direction := 0
var directionY := 0
func _physics_process(delta: float) -> void:
	#makes node face the mouse
	look_at(get_global_mouse_position())

	#both x and y axis movement
	var direction := 0
	var directionY := 0
	if Input.is_key_pressed(KEY_W):
		directionY = -1
	if Input.is_key_pressed(KEY_S):
		directionY = 1
	if Input.is_key_pressed(KEY_A):
		direction = -1
	if Input.is_key_pressed(KEY_D):
		direction = 1
	if direction or directionY:
		velocity.x = direction * SPEED
		velocity.y = directionY * SPEED

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()

#this is the code to register a left mouse click
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("You clicked on Sprite!")
