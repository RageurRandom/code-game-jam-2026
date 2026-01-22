extends Node

var current_weapon:AWeapon = FirstWeapon.new()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		print("catched")
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			current_weapon.shoot(event.position, get_tree().current_scene)
