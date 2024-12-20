extends Node
var coin = 0
var superjump = 0
var doublejump = 5
var lives = 1
var checkpoint = 0
var deathState = false


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_coin():
	coin = coin + 1
	print(coin)
func add_superjump():
	superjump = superjump + 1
func add_doublejump():
	doublejump = doublejump + 1
func doublejump_subtract():
	doublejump = doublejump - 1
	
