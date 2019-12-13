extends Area2D


func _ready():
	pass 


func _on_Item2_body_entered(body):
	if body.get_name() == "Player":
		global._on_reload_gold()
		queue_free()