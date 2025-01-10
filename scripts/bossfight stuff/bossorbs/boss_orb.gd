extends Area2D


func _on_ready() -> void:
	get_node("CollisionShape2D").disabled = true
	hide()

func _on_body_entered(body: Node2D) -> void:
	queue_free()
	Global.BossOrb += 1

func _physics_process(delta: float) -> void:
	if (Global.in_boss_fight == true):
			get_node("CollisionShape2D").disabled = false
			show()
