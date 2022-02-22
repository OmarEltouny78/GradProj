extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button6_pressed():
	ScreenChanger.change_scene("res://UI/MainMenu.tscn")


func _on_Button2_pressed():
	ScreenChanger.change_scene("res://Levels/Level6.tscn") 


func _on_Button_pressed():
	ScreenChanger.change_scene("res://Levels/Level1.tscn") 


func _on_Button3_pressed():
	ScreenChanger.change_scene("res://Levels/Level16.tscn") 


func _on_Button4_pressed():
	ScreenChanger.change_scene("res://Levels/Level21.tscn") 


func _on_Button5_pressed():
	ScreenChanger.change_scene("res://Levels/Level26.tscn") 
