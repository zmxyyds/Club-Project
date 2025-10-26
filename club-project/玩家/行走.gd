extends 状态
@onready var player = $"../.."
var gravity = ProjectSettings.get("physics/2d/default_gravity") as float
var run_state_ 
func enter():
	$"../../SubViewport/Remy".walk()
	run_state_ = true
	run_state()
	player.jump_number = 2
	player.hit_number =0
	pass



func run_state():
	await get_tree().create_timer(0.2).timeout
	run_state_ = false
func exit():pass

var movement_vector :Vector2
func update(_delta):
	var movement_vector =  player.get_movement_vector( )
	if  player.velocity.x== Vector2.ZERO.x:
		update_state.emit("待机")
#
	#if player.is_on_floor() and Input.is_action_just_pressed("move 上移") :
	if Input.is_action_just_pressed("move 上移") :
		update_state.emit("跳跃")
	

func physics_update(delta):
	var movement_vector =  player.get_movement_vector( ) 
	var direction = movement_vector.normalized()
	player.velocity.x = move_toward(player.velocity.x, direction.x * player.SPEED , player.加速度*delta)
	
