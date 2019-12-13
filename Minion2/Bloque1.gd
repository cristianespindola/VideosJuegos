extends Area2D

#var pos_nueva_x = 0
#var pos_nueva_y = 0

#onready var bloque_nuevo = preload("res://Bloque1.tscn")
var tileMap:TileMap
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize() 

func _on_Bloque1_body_entered(body):
	if body.get_name() == "Player":
		var sigPos = cellNext(player.movAnt)
		tileMap.puedeMoverse(self, sigPos,player.movAnt)

func cellNext(posPlayer):
	match posPlayer:
		"ui_right": return Vector2(position.x + 64, position.y)
		"ui_left": return Vector2(position.x - 64, position.y)
		"ui_up": return Vector2(position.x, position.y - 64)
		"ui_down": return Vector2(position.x, position.y + 64)
		
func moverse(sigPos,direccion):
	position = sigPos

func noMoverse():
	player.revertirMovimiento()