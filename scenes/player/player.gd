extends CharacterBody2D

const SPEED = 300.0
# const JUMP_VELOCITY = -400.0 # No necesitas salto en este juego

func _ready() -> void:
	# 1. Obtenemos el tamaño de la pantalla
	var screen_size = get_viewport_rect().size
	
	# 2. Calculamos la posición
	# X = La mitad del ancho (screen_size.x / 2)
	# Y = El alto total MENOS un margen (ej. 100 pixeles) para que se vea
	var start_x = screen_size.x / 2
	var start_y = screen_size.y - 100 
	
	# 3. Asignamos la posición
	position = Vector2(start_x, start_y)

func _physics_process(delta):
	# Lógica básica para mover solo a los lados (Cesta/Personaje)
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# Aseguramos que NO se mueva en Y (arriba/abajo)
	velocity.y = 0

	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("Entre")
	if area is FallingObjectBase:
		area.hit()
		if area.is_enemy:
			GameManager.lose_life()
			
		GameManager.add_score(area.score_value)
