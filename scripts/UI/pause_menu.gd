extends Control

func _ready() -> void:
	hide() # avoid errors

func _on_upgrade_menu_pressed() -> void:
	var tree = get_tree()
	if tree.paused:
		hide()
		tree.paused = false
	else :
		tree.paused = true
		show()
