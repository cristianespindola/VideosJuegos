extends Area2D

func _ready():
	pass 

#Prop: Desaparece si en el area dectecta a un jugador
func _on_PlataformaFantasma_area_entered(area):
	if area.get_name() == "jumper":
		queue_free()