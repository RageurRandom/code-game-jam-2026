extends Node2D

@export var timer:float = 5
@export var enemy_path:String = "res://scenes/entity/base_enemy.tscn"
@export var required_wave = 0
@export var randomize_x = true
@export var randomize_y = false

var required_wave_reached = false

const MAX_X = 574 - 32
const MIN_X = 32
const MAX_Y = 324 - 32
const MIN_Y = 32

var enemy:PackedScene = null

func _ready() -> void:
	enemy = load(enemy_path)
	_spawn_loop()

func _spawn_loop():
	while true:
		await get_tree().create_timer(timer).timeout
		if _can_spawn():
			spawn()


func _can_spawn()->bool:
	if get_tree().paused: return false
	
	if required_wave_reached: return true
	
	if  required_wave <= DifficultyManager.wave_number:
		required_wave_reached = true
		return true
		
	return false


func spawn():
	var new_enemy:Node2D = enemy.instantiate(PackedScene.GEN_EDIT_STATE_DISABLED)
	var new_x = position.x
	if(randomize_x):
		new_x = randi_range(MIN_X, MAX_X)
	
	var new_y = position.y
	if(randomize_y):
		new_y = randi_range(MIN_Y, MAX_Y)
	
	new_enemy.position = Vector2(new_x, new_y)
	get_tree().current_scene.add_child(new_enemy)
