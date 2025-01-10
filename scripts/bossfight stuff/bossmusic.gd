extends AudioStreamPlayer2D
@onready var bossm = %bossmusic


func _on_bossfling_r_bossfight() -> void:
	bossm.play()


func _on_bossfling_l_bossfight() -> void:
	bossm.play()

func _physics_process(delta: float) -> void:
	if Global.BossOrb == 7:
		bossm.stop()
