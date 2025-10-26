extends 状态
const jump_velocity = -400.0
@onready var player = $"../.."
var jump_number : int

func enter():
	$"../../SubViewport/Remy".jump()
	print("跳跃")
	player.mg = true
	jump_number = player.jump_number
	if jump_number == player.jump_number_start:
		player.velocity.y = jump_velocity
		player.jump_number -= 1
	pass

func exit():pass

func update(_delta):
	var movement_vector =  player.get_movement_vector( ) 
	var direction = movement_vector.normalized()


	if Input.is_action_just_pressed("move 上移") and player.jump_number>0:
		player.jump_number -= 1
		player.velocity.y = jump_velocity
	#if player.is_on_floor() and player.velocity.x== Vector2.ZERO.x:

	if player.is_on_floor():
		update_state.emit("行走")


func physics_update(_delta):
	var movement_vector =  player.get_movement_vector( ) 
	var direction = movement_vector.normalized()

	player.velocity.x = move_toward(player.velocity.x, direction.x * player.SPEED , player.加速度* _delta)
