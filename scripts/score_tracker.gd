class_name ScoreTracker extends Node

@export var enemy_death_value:int = 100
@export var score:int = 0

signal score_changed(score:int)

func _ready() -> void:
	EventBus.enemy_death.connect(_on_enemy_death)

func _on_enemy_death(score_won:int):
	score += score_won
	score_changed.emit(score)
	
func spend_score(amount:int):
	score -= amount
	score_changed.emit(score)
