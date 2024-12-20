extends Area2D

@onready var animated_sprite = %BOUNCE_PAD_SPRITE

func _on_body_entered(body: Node2D) -> void:
	body.boucepad_jump()
