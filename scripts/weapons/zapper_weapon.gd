class_name ZapperWeapon extends AWeapon

func shoot(root:Node2D):
	var position = root.get_global_mouse_position()
	var bullet = preload("res://scenes/bullet/zapper_bullet.tscn")
	var bulletNode:Node2D = bullet.instantiate(PackedScene.GEN_EDIT_STATE_DISABLED)
	bulletNode.position = position
	root.add_child(bulletNode)
