extends StaticBody2D






# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if (Global.in_boss_fight == true):
		get_node("CollisionShape2D").disabled = false
		show()
	else:
		get_node("CollisionShape2D").disabled = true
		hide()
