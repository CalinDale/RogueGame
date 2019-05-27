extends Node

onready var _pawn: Pawn = get_parent()
onready var _move_pause: Timer = get_node("MovePause")

var direction :Vector2 = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	move_in_direction( get_input_direction())

func move_in_direction(input_direction: Vector2) -> void:
	if input_direction != direction:
		_move_pause.reset()
	if input_direction != Vector2():
		direction = input_direction
		if _move_pause.is_stopped():
			_move_pause.start()
			_pawn.check_direction(direction)

func get_input_direction() -> Vector2:
	return Vector2(
			int(Input.is_action_pressed("move_east")) - int(Input.is_action_pressed("move_west")),
			int(Input.is_action_pressed("move_south")) - int(Input.is_action_pressed("move_north"))
	)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
