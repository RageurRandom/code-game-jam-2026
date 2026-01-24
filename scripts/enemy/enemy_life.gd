class_name EnemyLife extends Node

@export var life:float = 100
@export var invincibility_time = 0.1
@export var score_value = 100
var can_be_hit = true

signal this_enemy_hit
signal this_enemy_death

func _ready() -> void:
	await get_tree().create_timer(5).timeout
	queue_free() # TODO this is a workaround, I need to find the true issue (phantom hitboxes)

func on_hit(damage:float):
	if can_be_hit:
		can_be_hit = false
		
		EventBus.enemy_hit.emit()
		this_enemy_hit.emit()
		
		life -= damage
		
		if(life <= 0):
			_on_enemy_death()
		else:
			await get_tree().create_timer(invincibility_time).timeout
			can_be_hit = true

func _on_enemy_death():
	this_enemy_death.emit()
	EventBus.enemy_death.emit(score_value)
	queue_free()





#func _on_enemy_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	#if event is InputEventMouseButton:
		#if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			#on_hit()
		# on peux rajouter un event clic droit par ex
