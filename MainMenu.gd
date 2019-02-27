extends Control

func _ready():
	$CenterContainer/VBoxContainer/LblScore.text = "Score: " + str(Game.score_current)


func _on_BtnStart_pressed():
	Game.reset()
	get_tree().change_scene("res://World.tscn")
	pass


func _on_BtnQuit_pressed():
	get_tree().quit()
