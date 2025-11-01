extends Node3D

func walk():
	$AnimationPlayer.speed_scale = 1
	$AnimationPlayer.play("run/mixamo_com")

func idle():
	$AnimationPlayer.speed_scale = 1
	$AnimationPlayer.play("idle/mixamo_com")

func jump():
	$AnimationPlayer.speed_scale = 1
	$AnimationPlayer.play("jump/mixamo_com")

func roll():
	$AnimationPlayer.speed_scale = 2.5
	$AnimationPlayer.play("roll/mixamo_com")
	
func sword_basic():
	$AnimationPlayer.speed_scale = 1
	$AnimationPlayer.play("sword_basic/mixamo_com")
