extends KinematicBody2D

onready var Grid = get_parent()

var direction = Vector2()

var type

var is_moving = false
var target_pos = Vector2()
var target_direction = Vector2()

var movePauseMax = 0.5
var movePauseMin = 0.05
var movePauseSpeedup = 0.1
var movePauseDuration = 0

var oldInputDirection = Vector2()

var movePaused = false

var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var input_direction = get_input_direction()
	
	moveInDirection(input_direction)

func moveInDirection(input_direction):
	if input_direction != Vector2():
		if !movePaused:
			var target_position = Grid.request_move(self, input_direction)
			if target_position:
				move_to(target_position)
			startMovePause()
			oldInputDirection = input_direction
	if input_direction != oldInputDirection:
		movePaused = false
		movePauseDuration = movePauseMax

func startMovePause():
	movePaused = true
	var timer = get_node("MovePause")
	timer.wait_time = movePauseDuration
	timer.start()

func _on_MovePause_timeout():
	if movePauseDuration > movePauseMin:
		movePauseDuration -= movePauseSpeedup
		if movePauseDuration < movePauseMin:
			movePauseDuration = movePauseMin
	movePaused = false


func get_input_direction():
	return Vector2(
		int(Input.is_action_pressed("move_east")) - int(Input.is_action_pressed("move_west")),
		int(Input.is_action_pressed("move_south")) - int(Input.is_action_pressed("move_north"))
	)

func move_to(target_position):
	#var move_direction = (target_position - position).normalized()
	position = target_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass