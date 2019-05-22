extends "res://Scenes/pawn/Pawn.gd"

onready var grid = get_parent()
onready var _move_pause: Timer = get_node("MovePause")

var direction = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _unhandled_input(event):
	move_in_direction(get_input_direction())

func move_in_direction(input_direction):
	if input_direction != direction:
		_move_pause.reset()
	if input_direction != Vector2():
		direction = input_direction
		if _move_pause.is_stopped():
			_move_pause.start()
			var target_position = grid.request_move(self, input_direction)
			if target_position:
				move_to(target_position)

func get_input_direction():
	return Vector2(
			int(Input.is_action_pressed("move_east")) - int(Input.is_action_pressed("move_west")),
			int(Input.is_action_pressed("move_south")) - int(Input.is_action_pressed("move_north"))
	)

func move_to(target_position):
	position = target_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass