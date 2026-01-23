extends AnimatedSprite2D

@export var rotate_factor = 3

func _ready() -> void:
	play("default")
	

func _process(delta: float) -> void:
	rotate(delta * rotate_factor)


func _on_this_enemy_death() -> void:
	self.animation_finished.connect(hide)
	play("pop")
