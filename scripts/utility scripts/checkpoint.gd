extends Area2D
var collected = false

@onready var animated_sprite = %FLAG_SPRITE
# Called when the node enters the scene tree for the first time.


func _on_body_entered(body: Node2D) -> void:
	if collected == false:
		print("checkpoint +1")
		animated_sprite.play("collected")
		collected = true
		Global.checkpoint = Global.checkpoint + 1
			
