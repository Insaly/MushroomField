extends Node2D

export var velocitat = Vector2(300,300)

var cronometre_x = 0.8
var cronometre_y = 0.8

func _process(delta):

	velocitat.y = 100 * cronometre_y * 1.5
	velocitat.x = 100 * cronometre_x * 1.5
	
	if Input.is_action_just_pressed("mou_dreta") or Input.is_action_pressed("mou_dreta"):
		position.x += velocitat.x * delta
		cronometre_x += (1 * delta)
	if Input.is_action_just_pressed("mou_esquerra") or Input.is_action_pressed("mou_esquerra"):
		position.x -= velocitat.x * delta
		cronometre_x += (1 * delta)
	if Input.is_action_just_pressed("mou_avall") or Input.is_action_pressed("mou_avall"):
		position.y += velocitat.y * delta
		cronometre_y += (1 * delta)
	if Input.is_action_just_pressed("mou_amunt") or Input.is_action_pressed("mou_amunt"):
		position.y -= velocitat.y * delta
		cronometre_y += (1 * delta)

	if Input.is_action_just_released("mou_dreta") or Input.is_action_just_released("mou_dreta") and Input.is_action_just_released("mou_esquerra") or Input.is_action_just_released("mou_esquerra"):
		cronometre_x = 0.8
	if Input.is_action_just_released("mou_amunt") or Input.is_action_just_released("mou_amunt") and Input.is_action_just_released("mou_avall") or Input.is_action_just_released("mou_avall"):
		cronometre_y = 0.8

func _on_Area2D2_area_entered(area):
	if area.is_in_group('Inici'):
		modulate = Color(0.2, 0.7, 0.2)
		area.modulate = Color(0.5, 0.5, 0.5)
	if area.is_in_group('Final'):
		modulate = Color(0.7, 0.2, 0.2)
		area.modulate = Color(0.5, 0.5, 0.5)
		
func _on_Area2D2_area_exited(area):
	modulate = Color(1, 1, 1)
