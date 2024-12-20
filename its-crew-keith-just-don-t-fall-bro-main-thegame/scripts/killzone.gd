extends Area2D

signal player_death

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_body_entered(body: Node2D) -> void:
	Global.deathState = true
	Global.lives = Global.lives - 1
	if Global.coin > 0:
		Global.coin -= 1
	if Global.superjump > 0:
		Global.superjump -= 1
