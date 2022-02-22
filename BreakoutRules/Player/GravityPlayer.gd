extends KinematicBody2D


var UP_DIRECTION=Vector2.UP

export var speed:=240
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
var grav=1
var _death=false
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
	$Label.text="Jump multiplayer (up) " +str(jump_multiplayer)
	$Label2.text="Gravity equal (down) "+str(grav)
	if(_death):
		$AnimatedSprite.play("Death")
		is_running=false
		$death.emitting=true
		speed=0
	if(Input.is_action_just_pressed("ui_up")):
		jump_multiplayer+=1
	if(Input.is_action_just_pressed("ui_down")):
		gravity*=-1
		if(grav==1):
			$Label.rect_position=$Label.rect_position+Vector2(0,60)
			$Label2.rect_position=$Label.rect_position+Vector2(0,60)
		else:
			$Label.rect_position=$Label.rect_position+Vector2(0,-60)
			$Label2.rect_position=$Label.rect_position+Vector2(0,-60)
		$SfxrStreamPlayer.play()
	if(gravity>0):
		$AnimatedSprite.flip_v=false
		
		grav=1
	else:
		
		$AnimatedSprite.flip_v=true
		$AnimatedSprite.play("Walk")
		grav=-1
	if speed==0:
		$AnimatedSprite.play("Death")
	if(jump_multiplayer>=3):
		jump_multiplayer=0
	else:
		speed=100
	if is_jumping and _jump:
		_jump_made+=1
		_velocity.y=-jump_strength*jump_multiplayer
	if(jump_multiplayer!=0):
			$Jump.emitting=true
			$Jump.global_position = Vector2(global_position.x,global_position.y + 18)
			
	if !(is_jumping)and grav==1:
		$AnimatedSprite.play("Jump")
	if !(is_jumping)and grav==-1:
		$AnimatedSprite.play("Walk")
	if(is_running):
		$AnimatedSprite.play("Walk")

	_velocity.y+=gravity*delta
	if(!_death):
		_velocity.x=speed
	else:
		_velocity.x=0
	_velocity=move_and_slide(_velocity,UP_DIRECTION)
