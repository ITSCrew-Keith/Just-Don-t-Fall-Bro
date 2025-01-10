extends Area2D
var collected = false

@onready var animated_sprite3 = %FLAG_SPRITE3


func _on_body_entered(body: Node2D) -> void:
	if collected == false:
		print("checkpoint +1")
		animated_sprite3.play("collected")
		collected = true
		Global.checkpoint = Global.checkpoint + 1
