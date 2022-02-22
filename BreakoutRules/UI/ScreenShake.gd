extends Node
const TRANS=Tween.TRANS_SINE
const EASE=Tween.EASE_IN_OUT
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var amplitude=5

onready var camera=get_parent()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func start(duration=0.2,frequency=15,amplitude=16):
	self.amplitude=amplitude
	$Duration.wait_time=duration
	$Timer.wait_time=1/float(frequency)
	$Duration.start()
	$Timer.start()


func _new_shake():
	var rand=Vector2()
	rand.x=rand_range(-amplitude,amplitude)
	rand.y=rand_range(-amplitude,amplitude)
	$ShakeTween.interpolate_property(camera,"offset",camera.offset,rand,$Timer.wait_time,TRANS,EASE)
	$ShakeTween.start()
func _hor_shake():
	var rand=Vector2()
	rand.x=rand_range(-amplitude,amplitude)
	$ShakeTween.interpolate_property(camera,"offset",camera.offset,rand,$Timer.wait_time,TRANS,EASE)
	$ShakeTween.start()
func _vert_shake():
	var rand=Vector2()
	rand.y=rand_range(-amplitude,amplitude)
	$ShakeTween.interpolate_property(camera,"offset",camera.offset,rand,$Timer.wait_time,TRANS,EASE)
	$ShakeTween.start()
func _reset():
	$ShakeTween.interpolate_property(camera,"offset",camera.offset,Vector2(),$Timer.wait_time,TRANS,EASE)
	$ShakeTween.start()

func _on_Timer_timeout():
	_new_shake()
func _on_Duration_timeout():
	_reset()
	$Timer.stop()
