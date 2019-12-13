extends KinematicBody2D

# Declaración de variables locales
const aceleracion = 1500
const velocidad = 500
const friccion = 0.5
const gravedad = 400
const salto = 5000

var acc = Vector2()
var vel = Vector2() 

var world

var puedeSaltar = true
var puedeMover = true

func _ready():
	pass

#Prop: propiedades fisicas	
func _physics_process(delta):
	acc.y = gravedad
	
	movimiento("ui_left", -aceleracion, -acc)
	movimiento("ui_right", aceleracion, acc)
			
	vel.y += acc.y 
	vel.x = clamp(vel.x, -velocidad, velocidad)
	vel = move_and_slide(vel, Vector2.UP)
	
	saltar("ui_select", -salto)

#Prop: Dada una direccion, una aceleracion y un vector, mueve al personaje en dicha direccion a tal velocidad	
func movimiento(direccion, aceleracion, acc):
	if Input.is_action_pressed(direccion) and puedeMover:
		acc.x = aceleracion
	else:
		acc.x = 0
		
	if acc.x == 0:
		vel.x = max(abs(vel.x)* friccion, 0) * sign(vel.x)
	else:
		vel.x += acc.x

#Prop: Dada una tacla y una altura de salto, realiza tal salto	
func saltar(direccion, speed):
	
	if (Input.is_action_just_pressed(direccion) and is_on_floor() and puedeSaltar):
		vel.y = speed
		world.newSalto = position.y
		world.salto()
		

#Prop: No hace el Salto, aunque presione la tecla correcta
func anularSalto():
	puedeSaltar = false

#Prop: No se mueve, aunque presione una tecla de direccion correcta
func anularMovimiento():
	puedeMover = false
	
#Prop: El personaje se queda inmovil
func atapado():
	anularSalto()
	anularMovimiento()