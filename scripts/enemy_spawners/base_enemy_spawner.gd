extends Node2D

@export var timer:float = 5
@export var enemy_path:String = "res://scenes/entity/base_enemy.tscn"

var enemy:PackedScene = null

func _ready() -> void:
	enemy = load(enemy_path)
	
	while true:
		await get_tree().create_timer(timer).timeout
		spawn()
		print("spawned")


func spawn():
	print("SPAWNING")
	var new_enemy:Node2D = enemy.instantiate(PackedScene.GEN_EDIT_STATE_DISABLED)
	new_enemy.position = position
	get_tree().current_scene.add_child(new_enemy)
