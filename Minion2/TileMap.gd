extends TileMap

enum CellType {PARED, PISO}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func puedeMoverse(player, sigPos, direccion):
	var cellNext = world_to_map(sigPos)
	var cellNextType = get_cellv(cellNext)
	match cellNextType:
		CellType.PISO:
			player.moverse(sigPos,direccion)
		CellType.PARED:
			player.noMoverse()