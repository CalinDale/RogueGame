extends Node

# Declare member variables here. Examples:
signal pawn_clicked(pawn)
signal cell_clicked(cell)
onready var _Grid = get_parent().Grid


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("primary_click"):
		var clicked_cell = _get_clicked_cell()
		emit_signal("cell_clicked", clicked_cell)
		var clicked_pawn = _get_clicked_pawn()
		if clicked_pawn:
			emit_signal("pawn_clicked", clicked_pawn)
			return

func _get_clicked_cell() -> Vector2:
	var clicked_cell: Vector2 = get_node("../Nav/Grid").get_mouse_cell()
	return clicked_cell

func _get_clicked_pawn() -> Pawn:
	var clicked_pawn: Pawn = get_node("../Nav/Grid").get_pawn_at(_get_clicked_cell())
	return clicked_pawn