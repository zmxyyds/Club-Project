extends Node3D

func walk():
	$AnimationPlayer.play("run/mixamo_com")

func idle():
	$AnimationPlayer.play("idle/mixamo_com")

func jump():
	$AnimationPlayer.play("jump/mixamo_com")
