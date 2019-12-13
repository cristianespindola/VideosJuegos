extends Area2D

onready var winner = preload("res://Label/Winner.tscn")
var player

func _ready():
	pass 

func _on_Bloque2_area_entered(area):
	if area.get_name() == "Bloque1":
		var winner_new = winner.instance()
		winner_new.set_anchor_and_margin(MARGIN_TOP, 200 ,200)
		get_parent().add_child(winner_new)
		player.anularMovimiento()
		get_parent().siguienteNivel()