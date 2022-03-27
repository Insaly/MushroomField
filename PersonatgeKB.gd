extends KinematicBody2D

var velocitat_base = 400
var velocitat = Vector2.ZERO

var direccio = Vector2.DOWN
var gravetat = Vector2.DOWN * 980
var velocitat_salt = -500
var doble_salt = 2

func _process(delta):
	pass

func _physics_process(delta):
	velocitat.x = 0
	velocitat += gravetat * delta
	if Input.is_action_pressed("mou_dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
		$Normal.flip_h = true
	if Input.is_action_pressed("mou_esquerra"):
		velocitat += Vector2.LEFT * velocitat_base
		$Normal.flip_h = false
	if Input.is_action_just_pressed("mou_amunt") and is_on_floor() or Input.is_action_just_pressed("mou_amunt") and doble_salt >= 2:
		velocitat.y = velocitat_salt
		doble_salt -= 1
		
	if is_on_floor():
		doble_salt = 2
	
	velocitat = move_and_slide(velocitat, Vector2.UP)
