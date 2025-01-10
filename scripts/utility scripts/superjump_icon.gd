extends Sprite2D

func _ready() -> void:
	visible = false

func _on_shop_in_shop() -> void:
	if shop.choice == 1:
		visible = true
		print("working")
	else:
		visible = false
		
func _on_shop_out_shop() -> void:
	visible = false
