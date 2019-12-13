extends KinematicBody2D

var tileMap:TileMap
var puedeMover = true
var movAnt

func _ready():
	# GunTimer.wait_time = gun_cooldown
	
	pass
	
func _physics_process(delta):
	
	moverHotizontal("ui_right", 64)
	moverHotizontal("ui_left", -64)
	
	moverVertical("ui_up", -64)
	moverVertical("ui_down", 64)
		
func moverHotizontal(direccion, salto):
	if Input.is_action_just_pressed(direccion) and puedeMover:
		var sigPos = Vector2(position.x + salto, position.y)
		tileMap.puedeMoverse(self, sigPos,direccion)
	#	position.x += salto

func moverVertical(direccion, salto):
	if Input.is_action_just_pressed(direccion) and puedeMover:
		var sigPos = Vector2(position.x, position.y + salto)
		tileMap.puedeMoverse(self, sigPos, direccion)
		#position.y += salto
		
func moverse(sigPos, direccion):
	position = sigPos
	movAnt = direccion
	global._on_bronze()

func noMoverse():
	pass
	
func anularMovimiento():
	puedeMover = false

func revertirMovimiento():
	match movAnt:
		"ui_right": move_local_x(-64)
		"ui_left": move_local_x(64)
		"ui_up": move_local_y(64)
		"ui_down": move_local_y(-64)
func _on_cronometro_timeout():
	position.x = 140
	position.y = 100
