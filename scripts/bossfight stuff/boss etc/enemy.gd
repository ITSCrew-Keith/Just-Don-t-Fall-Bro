extends CharacterBody2D
@onready var terget=$"../player"
var speed = 75

func _physics_process(delta: float) -> void:
	if(Global.BossOrb == 7):
		queue_free()
		Global.in_boss_fight = false
	if(Global.in_boss_fight == true):
		var direction=(terget.position-position).normalized()
		velocity = direction * speed
		move_and_slide()
