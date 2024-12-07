extends Area2D

var player : Node = null


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	print("+1 coin")
	player.add_coin()
