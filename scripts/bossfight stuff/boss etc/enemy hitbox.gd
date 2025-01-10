extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.bossflingR = false
		Global.bossflingL = false
		Global.coin = 0
		Global.superjump = 0
		Global.doublejump = 5
		Global.checkpoint = 0
		Global.deathState = false
		Global.bossflingtimer = 20
		Global.in_boss_fight = false
		Global.BossOrb = 0
		get_tree().reload_current_scene()
