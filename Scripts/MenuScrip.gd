extends Control

func _ready():
	pass

func _on_Comenar_pressed():
	get_tree().change_scene("res://Escenes/Principal.tscn")


func _on_Sortir_pressed():
	get_tree().quit()
