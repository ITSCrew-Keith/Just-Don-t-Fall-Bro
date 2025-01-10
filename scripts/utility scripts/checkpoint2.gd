extends Area2D
var collected2 = false

@onready var animated_sprite2 = %FLAG_SPRITE2
# Called when the node enters the scene tree for the first time.


func _on_body_entered(body: Node2D) -> void:
	if collected2 == false:
		print("checkpoint +1")
		animated_sprite2.play("collected")
		collected2 = true
		Global.checkpoint = Global.checkpoint + 1
			
