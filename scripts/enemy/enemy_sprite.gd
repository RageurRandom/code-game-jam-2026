extends AnimatedSprite2D

func _ready() -> void:
	play("default")

func _on_this_enemy_hit() -> void:
	play("damaged")


func _on_this_enemy_death() -> void:
	self.animation_finished.connect(hide)
	play("pop")
