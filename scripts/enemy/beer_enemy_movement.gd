extends RigidBody2D

@export var randomFactor = 100
@export var initial_x_velocity:float = 200
@export var initial_y_velocity:float = 500


const SCREEN_WIDTH:int = 576
const SCREEN_HEIGHT:int = 324

var trueSpeed:float = 1.0
var initial_posi

func _ready() -> void:
	self.apply_central_impulse(Vector2(initial_x_velocity + randf()*randomFactor,
	 -initial_y_velocity + randf()*randomFactor))


func _physics_process(_delta: float) -> void:
	pass
	
