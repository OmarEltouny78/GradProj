extends Node2D


export var bullet_scene: PackedScene

func fire(origin: Vector2, angle_in: float):
	var direction = Vector2.UP.rotated(angle_in)
	var bullet = bullet_scene.instance()
	bullet.position = origin
	bullet.direction = direction
	add_child(bullet)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
