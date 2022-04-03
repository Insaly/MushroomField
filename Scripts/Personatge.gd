extends KinematicBody2D

var velocitat_base = 400
var velocitat = Vector2.ZERO

var direccio = Vector2.DOWN
var gravetat = Vector2.DOWN * 980
var velocitat_salt = -600
var contador_estrany = 0
var acabo_de_tocar_terra = false

func _process(delta):
	pass

func _physics_process(delta):
	velocitat.x = 0
	velocitat += gravetat * delta
	if Input.is_action_pressed("mou_dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("mou_esquerra"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("mou_amunt") and is_on_floor():
		velocitat.y = velocitat_salt
	velocitat = move_and_slide(velocitat, Vector2.UP)
		
	anima(velocitat)
	
func body_enter(body):
	if (body.get_name() == "Terra"):
		print("Ouch!")
	
func anima(velocitat):
	$Animacions.play("Normal")
	if velocitat.y != 0:
		$Animacions.play("Salt")
	if velocitat.x > 0:
		$Animacions.flip_h = true
	if velocitat.x < 0:
		$Animacions.flip_h = false
	if acabo_de_tocar_terra == true:
		$Animacions.play("Salt_Terra")

func _on_Animacions_animation_finished():
	if $Animacions.animation == 'Salt_Terra':
		acabo_de_tocar_terra = false
	if $Animacions.animation == 'Salt':
		acabo_de_tocar_terra = true

func _on_Area2D_body_entered(body):
	position = Vector2(250, 300)


func _on_Bandera_body_entered(body):
	contador_estrany += 1
	if contador_estrany >= 2:
		get_tree().change_scene("res://Escenes/Menu.tscn")
