extends Node2D

func _process(delta):
	if Input.is_action_pressed("mou_home") or Input.is_action_just_pressed("mou_home"):
		get_tree().change_scene("res://Menu.tscn")
