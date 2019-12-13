extends Control

var pasos = 100
onready var game_over = preload("res://Label/GameOver.tscn")
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	global.connect("bronze", self, "bronze")
	global.connect("reload", self, "reload")
	$score.text = "Pasos: " + str(pasos)
	pass
	
func bronze(s):
	pasos -= 10
	if(pasos <= 0):
		$score.text = "Pasos: " + "0"
		var game_over_new = game_over.instance()
		game_over_new.set_anchor_and_margin(MARGIN_TOP, 200 ,200)
		get_parent().add_child(game_over_new)
		player.anularMovimiento()
		#print("Se termino el combustible: GAME OVER!!")
	else:
	    $score.text = "Pasos: " + str(pasos)

func reload(s):
	pasos += 250
	$score.text = "Pasos: " + str(pasos)