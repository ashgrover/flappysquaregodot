extends KinematicBody2D


var motion = Vector2()
const UP = Vector2(0,-1)
const GRAVITY = 25
const JUMP_HEIGHT = 500

var is_running= false
var is_hit = false

func _ready():
	Game.connect("collided_with_pipe",self,"_collided")
	Game.play_music()
	
	pass

func _physics_process(delta):
	if is_running:
		motion.y += GRAVITY
		rotation_degrees += 0.5
	
	if not is_hit and Input.is_action_just_pressed("ui_up"):
		Game.game_state = true
		is_running = true
		rotation_degrees = -15
		motion.y = -JUMP_HEIGHT
	
	if Game.game_state:
		get_node("../LblHowto").hide()
	
	motion = move_and_slide(motion,UP)
	pass

func _collided():
	is_hit = true
	Game.stop_music()

func _on_Floor_body_entered(body):
	if body == self:
		Game.pipe_collision()
