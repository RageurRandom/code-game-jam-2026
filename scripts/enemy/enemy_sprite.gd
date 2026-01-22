extends Sprite2D

@export var clignotage:float = 1

func _on_this_enemy_hit() -> void:
	print(self.modulate)
	self.modulate = Color(1, 0, 0)
	await self.get_tree().create_timer(clignotage).timeout
	self.modulate = Color(1, 1, 1)
