extends Node2D

var scn_pipes = preload("res://Pipes.tscn")

func _ready():
	Game.connect("collided_with_pipe",self,"_on_collision_with_pipe")
	pass

func spawn_pipes():
	var new_pipes = scn_pipes.instance()
	add_child(new_pipes)
	pass
	

func _on_Timer_timeout():
	if Game.game_state:
		spawn_pipes()
	
func _on_collision_with_pipe():
	$Timer.stop()
	Game.game_state = false
