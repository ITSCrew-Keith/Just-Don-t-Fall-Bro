extends Label



func _physics_process(delta: float) -> void:
	if (Global.in_boss_fight == true):
		show()
	else:
		hide()
