extends Area2D
var choice = 1
var is_in_area = false
signal in_shop
signal out_shop

func _process(delta: float) -> void:
	if is_in_area and 	Input.is_action_just_pressed("KEY_E") and Global.coin >= 3 and shop.choice == 1:
		Global.superjump += 1
		Global.coin -= 3
		print("Superjump increased, coins reduced")
	if is_in_area and Input.is_action_just_pressed("KEY_E") and Global.coin >= 5 and shop.choice == 2:
		Global.doublejump += 5
		Global.coin -= 5
		print("doublejump bought money decreased")
		
	if Input.is_key_pressed(KEY_1):
		shop.choice = 1
		emit_signal("in_shop")
	if Input.is_key_pressed(KEY_2):
		shop.choice = 2
		emit_signal("in_shop")
	if Input.is_key_pressed(KEY_3):
		shop.choice = 3
		emit_signal("in_shop")

func _on_body_entered(body: Node2D) -> void:
	is_in_area = true
	emit_signal("in_shop")

func _on_body_exited(body: Node2D) -> void:
	is_in_area = false
	emit_signal("out_shop")
