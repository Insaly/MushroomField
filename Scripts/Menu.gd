extends Control

func _ready():
	pass

func _on_Comenar_pressed():
	get_tree().change_scene("res://Escenes/Principal.tscn")

func _on_Sortir_pressed():
	get_tree().quit()

func _on_Button_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
