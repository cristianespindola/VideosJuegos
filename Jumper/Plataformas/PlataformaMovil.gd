extends StaticBody2D

# Declaración de variables locales
var signo:int = -1

func _ready():
	set_process(true) 

#Prop: Mover la plataforma de un lado al otro
func _process(delta):
	global_position.x +=  (signo) * 300 * delta
	
	if(global_position.x <= 180):
		signo = 1
	else: if(global_position.x >= 830):
			signo = -1 