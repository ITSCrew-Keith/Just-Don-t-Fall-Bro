extends Label

var coin = 0
var coin_count = 0

@onready var coin_label = %Label

func add_coin() -> void:
	coin_count += 1  # Increase the coin count by 1
	update_coin_label()  # Update the label to reflect the new count

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		pass
	
	
	
func update_coin_label() -> void:
	coin_label.text = str(coin_count)  # Update the label text
