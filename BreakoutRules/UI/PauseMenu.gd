extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var is_paused=false setget set_is_paused
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _unhandled_input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		self.is_paused=!is_paused

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func set_is_paused(value):
	is_paused=value
	get_tree().paused=is_paused
	visible=is_paused

func _on_ResumeBtn_pressed():
	self.is_paused=false


func _on_MainBtn_pressed():
	ScreenChanger.change_scene("res://UI/MainMenu.tscn")
