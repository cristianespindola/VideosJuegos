extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	var minutos = int(get_node("../cronometro").get_time_left() / 60)
	var segundos = int(get_node("../cronometro").get_time_left()) % 60
	set_text(str(minutos) + ":" + str(segundos))
