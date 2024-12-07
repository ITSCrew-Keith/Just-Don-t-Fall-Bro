extends Area2D

var is_in_area = false

func _process(delta: float) -> void:
	if is_in_area and Input.is_key_pressed(KEY_E) and Global.coin >= 5:
		Global.superjump += 1
		Global.coin -= 5
		print("Superjump increased, coins reduced")

func _on_body_entered(body: Node2D) -> void:
	is_in_area = true
	print("player entered")

func _on_body_exited(body: Node2D) -> void:
	is_in_area = false
	print("player exited")
