extends ShapeCast2D

@export var sfx:AudioStream = preload("res://assets/sounds/fusil-de-chasse.mp3")
@export var sprite:AnimatedSprite2D
@export var damage:int = 100


func _ready() -> void:
	force_shapecast_update()
	
	var collisionned_bodies:Array = collision_result.map(
		func (dict):
			return dict["collider"]
	)
	
	collisionned_bodies.filter(
		func (col:PhysicsBody2D): return col.is_in_group("enemy")
	).map(
		func(enemy:PhysicsBody2D):
			var health:EnemyLife = enemy.find_child("EnemyLife")
			health.on_hit(damage)
	)
	
	
	EventBus.shot_fired.emit(sfx)
	
	sprite.play("default")
	await sprite.animation_finished
	sprite.hide()
	queue_free()
	
	
