class_name FirstWeapon extends AWeapon

func shoot(position:Vector2, root:Node2D):
	print("piou à ", position)
	var bullet = preload("res://scenes/bullet/base_bullet.tscn")
	root.add_child(bullet.instantiate(PackedScene.GEN_EDIT_STATE_DISABLED))
	
	
