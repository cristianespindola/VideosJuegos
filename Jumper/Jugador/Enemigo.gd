extends KinematicBody2D

# Declaración de variables locales
const aceleracion = 1500
const velocidad = 500
const friccion = 0.5
const gravedad = 400

var acc = Vector2()
var vel = Vector2() 

var player
var camara

func _ready():
	pass
	
func _physics_process(delta):
	acc.y = gravedad
	vel.y += acc.y 
	vel.x = clamp(vel.x, -velocidad, velocidad)
	vel = move_and_slide(vel, Vector2.UP)

#Prop: Si el jugador entro en el area lo ataca
func _on_Deteccion_area_entered(area):
	if area.get_name() == "jumper":
		player.atapado()
		camara.gameOver()
