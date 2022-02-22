extends KinematicBody2D


var UP_DIRECTION=Vector2.UP

export var speed:=100
export var jump_strength=1000.0
export var maximum_jump:=2
export var double_jump_strength:=160
export var gravity:=3500
#export var jump_dust=preload("res://Particles/Jump.tscn")
var _jump_made=0
var _velocity:=Vector2.ZERO
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var jump_multiplayer=1
var times=1
var _jump=false
var _death=false
var hit_the_ground=false
var motion_previous=Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	var is_falling:=_velocity.y>0.0 and not is_on_floor()
	var is_jumping:=  is_on_floor()
	var is_running:=is_on_floor() and not is_zero_approx(_velocity.x)
	$Label.text="Jump multiplayer(up) " +str(jump_multiplayer)
	$Label2.hide()
	if(_death):
		$AnimatedSprite.play("Death")
		is_running=false
		$death.emitting=true
		speed=0
	if(Input.is_action_just_pressed("ui_up")):
		jump_multiplayer+=1
	if(jump_multiplayer>=3):
		jump_multiplayer=0
	if is_jumping and _jump:
		_jump_made+=1
		_velocity.y=-jump_strength*jump_multiplayer
		if(jump_multiplayer!=0):
			$Jump.emitting=true
			$Jump.global_position = Vector2(global_position.x,global_position.y + 18)
	if !(is_jumping):
		$AnimatedSprite.play("Jump")
		$AnimationPlayer.play("Squash")
	if(is_running):
		$AnimatedSprite.play("Walk")
		
	
	motion_previous =_velocity
	_velocity.y+=gravity*delta
	_velocity.x=speed
	_velocity=move_and_slide(_velocity,UP_DIRECTION)

# Replace with function body.



	





