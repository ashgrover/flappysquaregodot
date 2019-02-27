extends Node2D

const PLAYER_TYPE = preload("res://Player.gd")


onready var top_node = get_node("Top")
onready var point_area_node = get_node("PointArea")
onready var bottom_node = get_node("Bottom")

const UP = Vector2(0,-1)
var motion = Vector2()
var is_moving = true

func _ready():
	Game.connect("collided_with_pipe",self,"_on_collided_with_pipe")
	position.x = 800
	
	var offset = (randi() % 10 + 1) * 15
	if offset > 75:
		offset *= -1
	
	position.y += offset
	pass


func _physics_process(delta):
	if is_moving:
		position.x -= Game.pipes_moving_speed
	
	#Just keeping following commented code for future reference
#	top_node.position.x -= Game.pipes_moving_speed
#	bottom_node.position.x -= Game.pipes_moving_speed
#	point_area_node.position.x -= Game.pipes_moving_speed
	
	if(position.x < 0):
		queue_free()
#		top_node.position.x = 900
#		bottom_node.position.x = 900
#		point_area_node.position.x = 900
#	pass
	

func _on_pipe_body_entered(body):
	Game.pipe_collision()
	pass


func _on_collided_with_pipe():
	is_moving = false
	

func _on_PointArea_body_entered(body):
	if body is PLAYER_TYPE:
		Game.score_current += 1
