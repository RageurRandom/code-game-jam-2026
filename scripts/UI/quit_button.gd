extends TextureButton

@export var juicyPlayer:Juicy_player

func _on_button_down() -> void:
	# wait for the juicy effect to end
	juicyPlayer.Play()
	
	await juicyPlayer.juice_player_end
	
	get_tree().quit()
