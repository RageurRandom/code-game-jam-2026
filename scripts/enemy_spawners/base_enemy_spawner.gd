extends Node2D

@export var timer:float = 5
@export var enemy_path:String = "res://scenes/entity/base_enemy.tscn"

@export var randomize_x = true

const MAX_X = 574 - 32
const MIN_X = 32

var enemy:PackedScene = null

func _ready() -> void:
	enemy = load(enemy_path)
	_spawn_loop()

func _spawn_loop():
	while true:
		await get_tree().create_timer(timer).timeout
		if not get_tree().paused:  # Vérifie si le jeu n'est pas en pause
			spawn()

func spawn():
	var new_enemy:Node2D = enemy.instantiate(PackedScene.GEN_EDIT_STATE_DISABLED)
	var new_x = position.x
	if(randomize_x):
		new_x = randi_range(MIN_X, MAX_X)
	
	new_enemy.position = Vector2(new_x, position.y)
	get_tree().current_scene.add_child(new_enemy)
