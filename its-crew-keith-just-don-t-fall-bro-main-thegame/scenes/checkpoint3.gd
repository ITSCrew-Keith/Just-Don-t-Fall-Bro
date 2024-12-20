extends Area2D
var is_in_area2 = false
var collected = false

@onready var animated_sprite3 = %FLAG_SPRITE3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if collected == false:
		print("checkpoint +1")
		animated_sprite3.play("collected")
		collected = true
		Global.checkpoint = Global.checkpoint + 1
