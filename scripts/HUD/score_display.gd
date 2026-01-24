extends Label


func _on_score_score_changed(score: int) -> void:
	var new_text = "$ %d"
	self.text = new_text % score
