class_name EnemyLife extends Node

@export var life:float = 100
@export var sprite:Sprite2D
@export var click_damage = 99
@export var invincibility_time = 0.5
var can_be_hit = true

signal this_enemy_hit
signal this_enemy_death

func _ready() -> void:
	pass

func _on_hit():
	if can_be_hit:
		can_be_hit = false
		
		EventBus.enemy_hit.emit()
		this_enemy_hit.emit()
		_process_damage()
		if(life <= 0):
			_on_enemy_death()
		else:
			await get_tree().create_timer(invincibility_time).timeout
			can_be_hit = true

func _on_enemy_death():
	this_enemy_death.emit()
	EventBus.enemy_death.emit()
	#var parent:Node = get_parent()
	#parent.hide() #TODO attendre anim


func _process_damage():
	life -= click_damage #TODO


func _on_enemy_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			_on_hit()
		# on peux rajouter un event clic droit par ex
