extends Node

@export var juicy_player:Juicy_player

#var current_weapon:AWeapon = FirstWeapon.new()
var current_weapon:AWeapon = ShotgunWeapon.new()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			current_weapon.shoot(get_tree().current_scene)
			juicy_player.Play()
			
func change_weapon(new_weapon:AWeapon):
	current_weapon = new_weapon
