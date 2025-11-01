extends 状态

@onready var player = $"../.."
var direction
var movement_vector
var speed
func enter():
	$"../../SubViewport/Remy".roll()
	movement_vector =  player.get_movement_vector( ) 
	direction = movement_vector.normalized()
	speed = 150
	pass

func exit():pass

func update(_delta):
	movement_vector =  player.get_movement_vector( )
	if  player.velocity.x <= 0 and direction.x >= 0 or player.velocity.x >= 0 and direction.x <= 0:
		update_state.emit("行走")
	if not player.is_on_floor():
		#update_state.emit("行走")
		if Input.is_action_just_pressed("move 上移") :
			update_state.emit("跳跃")

func physics_update(_delta):

	#player.velocity.x = move_toward(player.velocity.x, direction.x * player.MAX_SPEED / 2, player.加速度c*delta)
	#player.velocity.y = move_toward(player.velocity.y,direction.y* player.MAX_SPEED /2, player.加速度c* delta)
	player.velocity.x = move_toward(player.velocity.x, direction.x * speed * 3, player.加速度*_delta*3)
	#player.velocity.y += gravity *delta
	speed -= 5
	pass
