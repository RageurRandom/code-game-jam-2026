extends AudioStreamPlayer

func _ready() -> void:
	EventBus.shot_fired.connect(_on_shot_fired)
	
func _on_shot_fired(sfx:AudioStream):
	self.stream = sfx
	play()
