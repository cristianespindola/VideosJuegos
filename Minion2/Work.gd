extends Node2D

onready var level1 = preload("res://levels/level1/Level1.tscn")
var level

func _ready():
	level = level1.instance()
	level.work = self
	self.add_child(level)

func siguienteNivel():
	var levelSig = level.sigLevel.instance()
	level.queue_free()
	self.add_child(levelSig)