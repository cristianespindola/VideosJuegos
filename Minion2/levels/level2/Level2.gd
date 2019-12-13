extends Node2D

onready var player = $Player
onready var tablero = $TileMap
onready var bloque = $Bloque1
onready var canvas = $UI/Control
onready var meta = $Bloque2

var sigLevel
var work

func _ready():
	player.tileMap = tablero
	bloque.player = player
	bloque.tileMap = tablero
	canvas.player = player
	meta.player = player

func siguienteNivel():
	if(! work == null and ! sigLevel == null):
		work.siguienteNivel()