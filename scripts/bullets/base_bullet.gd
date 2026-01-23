extends ShapeCast2D

const duration = 1/60

func _ready() -> void:
	get_tree().create_timer(duration).timeout.connect(_on_duration_finished)
	
func _on_duration_finished():
	queue_free() #destroy node
