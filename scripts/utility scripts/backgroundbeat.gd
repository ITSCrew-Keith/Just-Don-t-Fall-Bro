extends AudioStreamPlayer2D
@onready var background = %background
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	background.play()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Global.in_boss_fight == true):
		background.stop()
