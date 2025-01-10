extends Area2D
signal bossfight
func _on_body_entered(body: Node2D) -> void:
	position.x = 1000000
	if Global.bossflingtimer > 0:
		emit_signal("bossfight")
		Global.in_boss_fight = true
		Global.bossflingR = true
		print(Global.bossflingtimer)
