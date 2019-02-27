extends Node

var game_state = false
var pipes_moving_speed = 3
var score_current = 0 setget _set_score_current
var score_best = 0 setget _set_score_best
var audio_node = null

signal score_current_changed
signal score_best_changed
signal collided_with_pipe

func _ready():
	score_current = 0
	pass

func reset():
	score_current = 0
	score_best = 0

func _physics_process(delta):
	pass
	
func _set_score_current(new_value):
	score_current = new_value
	emit_signal("score_current_changed")
	pass
	
func _set_score_best(new_value):
	score_best = new_value
	emit_signal("score_best_changed")
	pass
	
func pipe_collision():
	emit_signal("collided_with_pipe")
	pass
	

func play_music():
#	get_node("/root/World/AudioStream").play()
	pass
	
func stop_music():
#	get_node("/root/World/AudioStream").stop()
	pass
	