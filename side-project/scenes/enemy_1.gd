extends CharacterBody2D

@onready var target= $"../player"
var speed = 45


func _physics_process(delta: float) -> void:
	var direction = (target.position-position).normalized()
	velocity = direction * speed
	move_and_slide()
