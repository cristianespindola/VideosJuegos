extends Area2D

func _ready():
	pass # 
	

func _on_Item4_body_entered(body):
	if body.get_name() == "Player":
		global._on_reload_power_up()
		queue_free()