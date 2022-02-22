extends KinematicBody2D

var UP_DIRECTION=Vector2.UP

export var speed:=100
export var jump_strength=1000.0
export var maximum_jump:=2
export var double_jump_strength:=160
export var gravity:=3500

var _jump_made=0
var _velocity:=Vector2.ZERO
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var jump_multiplayer=1
var times=1
var _jump=false
var _multi_speed=1
var labelint=1
var _death=false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func flash():
	$AnimatedSprite.set_shader_param("")
func _physics_process(delta):
	var is_falling:=_velocity.y>0.0 and not is_on_floor()
	var is_jumping:=  is_on_floor()
	var is_running:=is_on_floor() and not is_zero_approx(_velocity.x)
	$Label.text="Player direction (left) " + str(labelint)
	$Label2.text="Player speed multiplayer (right)"+ str(_multi_speed)
	if(_death):
		$AnimatedSprite.play("Death")
		is_running=false
		$death.emitting=true
		speed=0
	if(Input.is_action_just_pressed("ui_left")):
		speed*=-1
		$SfxrStreamPlayer3.play()
	if(Input.is_action_just_pressed("ui_right")):
		_multi_speed+=1
		if(_multi_speed!=1):
			$SfxrStreamPlayer2.play()
			$AnimatedSprite.play("Dash")
		
	if(_multi_speed>3):
		_multi_speed=1
		$AnimatedSprite.play("Idle")
	if(speed>0):
		$AnimatedSprite.flip_h=false
		labelint=1
	else:
		$AnimatedSprite.flip_h=true
		$AnimatedSprite.play("Reverse")
		labelint=-1
	if(speed==0):
		$AnimatedSprite.play("Death")
	if(jump_multiplayer>=3):
		jump_multiplayer=0
	if is_jumping and _jump:
		$AnimatedSprite.play("Jump")
		_jump_made+=1
		_velocity.y=-jump_strength*jump_multiplayer
		if(jump_multiplayer!=0):
			$Jump.emitting=true
			$Jump.global_position = Vector2(global_position.x,global_position.y + 18)
	if !(is_jumping):
		$AnimatedSprite.play("Jump")
	if(is_running):
		$AnimatedSprite.play("Walk")
	
	_velocity.y+=gravity*delta
	_velocity.x=speed*_multi_speed
	_velocity=move_and_slide(_velocity,UP_DIRECTION)

