extends CharacterBody2D

@export var randomFactor = 1.0
@export var baseSpeed = 2

var trueSpeed:float = 1.0

func _ready() -> void:
	trueSpeed = baseSpeed + ((randf() - 0.5) * randomFactor)
	
func _physics_process(_delta: float) -> void:
	var _collision = move_and_collide(Vector2(0, -1) * trueSpeed) #TODO
