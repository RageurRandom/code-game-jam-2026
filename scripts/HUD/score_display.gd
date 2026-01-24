extends Label
var currentScore:int = 0

func _ready() -> void:
	EventBus.new_wave.connect(_updateLabel)
	_updateLabel()

func _on_score_score_changed(score: int) -> void:
	currentScore = score
	_updateLabel()
	
func _updateLabel():
	var new_text = "$ %d / %d required"
	self.text = new_text % [currentScore, DifficultyManager.getRequiredScore()]
