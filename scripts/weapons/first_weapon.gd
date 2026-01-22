class_name FirstWeapon extends AWeapon

func shoot(position:Vector2, root:Node2D):
	print("piou à ", position)
	var bulletShape = load("res://resources/shapes/first_weapon_bullet_shape.tres")
	
	
