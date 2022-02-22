extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	TimeCount.end=true
	$Label2.text="Score: " +str(int(TimeCount.time))


func _on_Button_pressed():
	ScreenChanger.change_scene("res://UI/MainMenu.tscn")
