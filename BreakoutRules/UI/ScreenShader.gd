extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var animation_player=$AnimationPlayer
signal scene_changeout()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func change_scene(path,delay=0.5):
	yield(get_tree().create_timer(delay),"timeout")
	animation_player.play("Fading")
	yield(animation_player,"animation_finished")
	assert(get_tree().change_scene(path)==OK)
	animation_player.play_backwards("Fading")
