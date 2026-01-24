extends TextureButton

@export var juicyPlayer:Juicy_player


func _on_button_down() -> void:
	juicyPlayer.Play()
	await juicyPlayer.juice_player_end
	get_tree().change_scene_to_file("res://scenes/UI/credits.tscn")
	
