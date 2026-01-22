extends AnimatedSprite2D

@export var clignotage:float = 1

func _on_this_enemy_hit() -> void:
	play("damaged")


func _on_this_enemy_death() -> void:
	self.animation_finished.connect(hide)
	play("exploding")
