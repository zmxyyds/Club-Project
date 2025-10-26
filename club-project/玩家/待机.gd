extends 状态

@onready var player = $"../.."

func enter():
	$"../../SubViewport/Remy".idle()
	pass

func exit():pass

func update(_delta):
	var movement_vector =  player.get_movement_vector( )
	if movement_vector:
		update_state.emit("行走")
	if player.is_on_floor() and Input.is_action_just_pressed("move 上移") :
		update_state.emit("跳跃")
		
	
	


func physics_update(_delta):
	pass
