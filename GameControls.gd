extends Control


func _ready():
	Game.connect("collided_with_pipe",self,"_on_collided")
	hide()
	pass
	

func _on_btnRestart_pressed():
	Game.reset()
	get_tree().change_scene("res://World.tscn")
	pass


func _on_btnMainMenu_pressed():
	get_tree().change_scene("res://MainMenu.tscn")
	pass 

func _on_collided():
	show()
	pass