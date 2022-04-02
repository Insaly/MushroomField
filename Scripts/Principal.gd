extends Node2D

func _process(delta):
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()
		
	if Input.is_action_just_pressed("pausa"):
		get_tree().change_scene("res://Escenes/Menu.tscn")
