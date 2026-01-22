extends CharacterBody2D

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	var collision = move_and_collide(Vector2(1, 0)) #TODO
