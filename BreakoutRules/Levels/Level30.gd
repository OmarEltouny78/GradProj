extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$MovingVert/AnimationPlayer.play("Move")
	$MovingVert2/AnimationPlayer.play("Move")



func _on_Flag_body_entered(body):
	if body.name=="Player":
		$Flag/SfxrStreamPlayer.play() 
		ScreenChanger.change_scene("res://UI/EndScreen.tscn") 



func _on_Reset_body_entered(body):
	if body.name=="Player":
		body._death=true
		$Fall.play()
		#$SfxrStreamPlayer.play()
		ScreenChanger.change_scene("res://Levels/Level30.tscn") 