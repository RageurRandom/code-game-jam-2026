extends CharacterBody2D

var speedFactor:float = 1.0

func _ready() -> void:
	speedFactor = randf() + 1
	
func _process(delta: float) -> void:
	var collision = move_and_collide(Vector2(0, -1) * speedFactor) #TODO
