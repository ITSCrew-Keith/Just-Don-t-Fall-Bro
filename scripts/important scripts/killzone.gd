extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_body_entered(body: Node2D) -> void:
	Global.deathState = true
	if Global.coin > 0:
		Global.coin -= 1
	if Global.superjump > 0:
		Global.superjump -= 1
