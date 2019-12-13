extends Node2D

# Declaración de variables locales
onready var pagInicio = $Main
onready var world = preload("res://World.tscn")

#Prop: Al detectar la señal realiza una accion
func _ready():
	pagInicio.connect("iniciarJuego", self, "_on_Main_iniciarJuego")

#Prop: Inicia el Juego	
func _on_Main_iniciarJuego():
	var newWorld = world.instance()
	pagInicio.queue_free()
	self.add_child(newWorld)