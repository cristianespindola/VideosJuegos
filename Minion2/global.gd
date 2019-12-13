extends Node2D

var score = 0

signal bronze
signal reload
signal reload_gold
signal reload_powerup

func _ready():
	pass # Replace with function body.

func _on_bronze():
	#score -= 1
	emit_signal("bronze", score)
	
func _on_reload():
	emit_signal("reload", score)
	
func _on_reload_gold():
	emit_signal("reload_gold", score)
	
func _on_reload_power_up():
	emit_signal("reload_powerup", score)