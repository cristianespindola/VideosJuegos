extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var textGaOv = preload("res://Label/GameOver.tscn")
onready var player = $Player
onready var tile = $TileMap
onready var canvas = $UI/Control
onready var canvas2 = $Bloque2
onready var bloque = $Bloque1
# Called when the node enters the scene tree for the first time.
func _ready():
	player.tileMap = tile
	player.level_1 = self
	canvas.player = player
	canvas2.player = player
	bloque.tileMap = tile
	bloque.player = player
	# Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
