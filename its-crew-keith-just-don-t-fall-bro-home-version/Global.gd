extends Node
var coin = 0
var superjump = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func add_coin():
	coin = coin + 1
	print(coin)
func add_superjump():
	superjump = superjump + 1
	
