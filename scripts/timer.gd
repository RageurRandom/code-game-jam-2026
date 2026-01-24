extends Timer
@export var timeLabel:Label
@export var timerSprite:AnimatedSprite2D

func _process(delta: float) -> void:
	timeLabel.text = "%d" % time_left
	timerSprite.frame = 17 - roundi(time_left/2)
	print(roundi(time_left/2))

#TODO on timer ended => end wave
