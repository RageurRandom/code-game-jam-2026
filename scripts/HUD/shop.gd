extends ItemList

var buyable_weapons = [
	{
		"name":"Shotgun",
		"price": 100,
		"object":ShotgunWeapon.new(),
	}
]

func _ready() -> void:
	for weapon in buyable_weapons:
		add_item("%s : %d $" % [weapon["name"], weapon["price"]])
