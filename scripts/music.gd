extends AudioStreamPlayer

@export var music_array:Array[AudioStream] = [
	preload("res://assets/music/Chiptune_DRIVE.mp3"),
	preload("res://assets/music/Progressing_through_the_levels.mp3")
]

func _ready() -> void:
	var selected_music = music_array.pick_random()
	stream = selected_music
	play()
