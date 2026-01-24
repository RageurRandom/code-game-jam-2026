extends TextureButton
@export var juicy_player:Juicy_player


func _on_button_down() -> void:
	juicy_player.Play()
	await juicy_player.juice_player_end
	get_tree().change_scene_to_file("res://scenes/main.tscn")
