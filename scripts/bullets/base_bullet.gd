extends ShapeCast2D

func _ready() -> void:
	force_shapecast_update()
	
	var collisionned_bodies:Array = collision_result.map(
		func (dict):
			return dict["collider"]
	)
	
	collisionned_bodies.filter(
		func (col:PhysicsBody2D): return col.is_in_group("enemy")
	).map(
		func(enemy:CharacterBody2D):
			var health:EnemyLife = enemy.find_child("EnemyLife")
			health.on_hit()
	)
	
	queue_free()
	
	
