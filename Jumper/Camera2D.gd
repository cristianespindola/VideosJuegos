extends Camera2D

# Declaración de variables locales
onready var textGaOv = preload("res://Label/GameOver.tscn")
onready var newScore= $Control/Label

var player
var world
var perdio:bool = true

func _ready():
	set_process(true)

#Prop: Sigue al persoje mientras sube, pero no cuando baja	
func _process(delta):
	global_position.y = min(global_position.y, player.global_position.y)
	if(get_camera_position().y + 600 < player.global_position.y):
		if(perdio):
			perdio = false
			gameOver()
			player.anularSalto()

#Prop: Muestra un mensaje de Game Over cuando el personaje se cae			
func gameOver():
	var newTextGaOv = textGaOv.instance()
	newTextGaOv.set_position(Vector2(get_camera_position().x-300,get_camera_position().y))
	world.add_child(newTextGaOv)