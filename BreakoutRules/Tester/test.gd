extends Polygon2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var collision_shape=CollisionPolygon2D.new()
	collision_shape.polygon=polygon
	$StaticBody2D.add_child(collision_shape) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
