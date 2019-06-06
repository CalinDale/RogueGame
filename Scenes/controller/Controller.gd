extends Node

onready var _Pawn: Pawn = get_parent()
onready var _MovePause: Timer = get_node("MovePause")
# onready var Controller: PackedScene = preload("res://Scenes/controller/Controller.tscn")

var direction :Vector2 = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	_move_in_direction( _get_input_direction( event ))

func _move_in_direction(input_direction: Vector2) -> void:
	if input_direction != direction:
		_MovePause.reset()
	if input_direction != Vector2():
		direction = input_direction
		if _MovePause.is_stopped():
			_MovePause.start()
			_Pawn.check_direction(direction)

func _get_input_direction( event: InputEvent ) -> Vector2:
	return Vector2(
			int(event.is_action_pressed("move_east")) - int(event.is_action_pressed("move_west")),
			int(event.is_action_pressed("move_south")) - int(event.is_action_pressed("move_north"))
	)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
