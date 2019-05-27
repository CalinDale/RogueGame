extends Node

onready var _pawn: Pawn = get_parent()
onready var _move_pause: Timer = get_node("MovePause")

var direction :Vector2 = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	_pawn.get_parent().connect("pawn_clicked", self, "_on_Grid_pawn_clicked")
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	_move_in_direction( _get_input_direction( event ))

func _move_in_direction(input_direction: Vector2) -> void:
	if input_direction != direction:
		_move_pause.reset()
	if input_direction != Vector2():
		direction = input_direction
		if _move_pause.is_stopped():
			_move_pause.start()
			_pawn.check_direction(direction)

func _get_input_direction( event: InputEvent ) -> Vector2:
	return Vector2(
			int(event.is_action_pressed("move_east")) - int(event.is_action_pressed("move_west")),
			int(event.is_action_pressed("move_south")) - int(event.is_action_pressed("move_north"))
	)

func _on_Grid_pawn_clicked(clicked_pawn: Pawn):
	_move_controller_to_pawn(clicked_pawn)

func _move_controller_to_pawn(target_pawn: Pawn):
	pass
	#pack controller as a scene
	#place controller as child of pawn
	# remove this controller

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
