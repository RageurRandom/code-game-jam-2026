#TODO Refactor, this class shouldn't handle all that
extends Timer
@export var timeLabel:Label
@export var timerSprite:AnimatedSprite2D
@export var waveLabel:Label
@export var WAVE_SHOWING_TIME:float = 3
@export var scoreTracker:ScoreTracker
@export var gameOverLabel:Label


func _ready() -> void:
	gameOverLabel.hide()
	waveLabel.hide()

func _process(_delta: float) -> void:
	timeLabel.text = "%d" % time_left
	timerSprite.frame = 17 - roundi(time_left/2)
	print(roundi(time_left/2))


func _on_timeout() -> void:
	get_tree().paused = true
	
	if !_can_pass_level():
		#get_tree().paused = false
		_game_over()
		return
	
	DifficultyManager.wave_number += 1
	EventBus.new_wave.emit()
	
	#TODO extract this in waveLabel script
	
	waveLabel.text = "WAVE %d" % DifficultyManager.wave_number
	waveLabel.show()
	
	_clear_scene()
	await get_tree().create_timer(WAVE_SHOWING_TIME).timeout
	
	waveLabel.hide()
	
	get_tree().paused = false
	start()
	

func _can_pass_level()->bool:
	var currentScore = scoreTracker.score
	var requiredScore = DifficultyManager.getRequiredScore()
	
	if currentScore < requiredScore:
		return false
	
	scoreTracker.spend_score(requiredScore)
	return true

func _game_over():
	_clear_scene()
	gameOverLabel.show()
	#TODO animation/GO scene
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://scenes/UI/title.tscn")

func _clear_scene():
	var tree = get_tree()
	tree.call_group("enemy", "queue_free") # remove enemies
