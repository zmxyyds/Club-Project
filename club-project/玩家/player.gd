extends CharacterBody2D

@export var 加速时间 = 0.1
@export var can_combo :=false
var SPEED = 130
var 加速度 = SPEED / 加速时间
var hit_number = 0
var jump_number_start = 2
var jump_number = jump_number_start
var gravity = ProjectSettings.get("physics/2d/default_gravity") as float
var mg = true
var inuse = true



func _ready() -> void:
	add_to_group("player")





func get_movement_vector():	
	var x_movement = Input.get_action_strength("move 右移") - Input.get_action_strength("move 左移")
	var y_movement = Input.get_action_strength("move 下移") - Input.get_action_strength("move 上移")
	return Vector2(x_movement,y_movement) 
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return

func _physics_process(delta: float) -> void:
	if inuse:
		velocity.y += gravity * delta
	var movement_vector = get_movement_vector( )
	var direction = movement_vector.normalized()
	move_and_slide()
	
	if not is_zero_approx(direction.x):
		#if   direction.x > 0:
			#collision_shape_2d.scale.x = 1
			#_rotate = rotation
		#elif direction.x < 0 :
			#collision_shape_2d.scale.x = -1
			#_rotate = rotation + PI
		$Sprite2D.flip_h = direction.x < 0
