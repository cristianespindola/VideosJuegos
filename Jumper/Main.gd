extends CanvasLayer

# Declaración de variables locales
onready var boton = $Play

signal iniciarJuego

#Prop: emite la señal
func _on_Play_pressed():
	boton.hide()
	emit_signal("iniciarJuego")