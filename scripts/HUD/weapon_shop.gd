extends ItemList

@export var shootManager:ShootManager
@export var scoreTracker:ScoreTracker

var current_index:int = -1

var buyable_weapons = [
	{
		"name":"Shotgun",
		"price": 100,
		"object":ShotgunWeapon.new(),
		"icon":preload("res://assets/weapon/icons/shotgun_icon.tres")
	}
]

func _ready() -> void:
	for weapon in buyable_weapons:
		add_item("%s : %d $" % [weapon["name"], weapon["price"]], weapon["icon"])



func _on_item_selected(index: int) -> void:
	print(index, buyable_weapons[index])
	current_index = index
	


func _on_check_button_pressed() -> void:
	if current_index != -1 and scoreTracker.score >= buyable_weapons[current_index]["price"]:
		scoreTracker.spend_score(buyable_weapons[current_index]["price"])
		shootManager.change_weapon(buyable_weapons[current_index]["object"])
		# TODO faire en sorte qu'on puisse rééquiper une arme déjà achetée
