extends KinematicBody2D

onready var Grid = get_parent()

var direction = Vector2()

var type

var is_moving = false
var target_pos = Vector2()
var target_direction = Vector2()

onready var movePause: Timer = get_node("MovePause")

var oldInputDirection = Vector2()

var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)

func _unhandled_input(event):
	var input_direction = get_input_direction()
	move_in_direction(input_direction)

func move_in_direction(input_direction):
	if input_direction != Vector2():
		if movePause.is_stopped():
			var target_position = Grid.request_move(self, input_direction)
			if target_position:
				move_to(target_position)
			movePause.start()
			oldInputDirection = input_direction
	if input_direction != oldInputDirection:
		movePause.reset()

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