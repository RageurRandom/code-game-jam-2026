class_name EnemyLife extends Node

@export var life:float = 100
@export var sprite:Sprite2D
@export var click_damage = 99

signal this_enemy_hit

func _ready() -> void:
	pass

func _on_hit():
	EventBus.enemy_hit.emit()
	this_enemy_hit.emit()
	print(life)
	_process_damage()
	if(life <= 0):
		_on_enemy_death()


func _on_enemy_death():
	EventBus.enemy_death.emit()
	var parent:Node = get_parent()
	parent.hide()


func _process_damage():
	life -= click_damage #TODO


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			_on_hit()
		# on peux rajouter un event clic droit par ex
