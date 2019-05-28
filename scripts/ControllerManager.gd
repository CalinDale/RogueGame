extends Node

# Declare member variables here.
const GRID_PATH: NodePath = NodePath("../Grid")
const START_CONTROLLER_PATH: NodePath = NodePath("../Grid/Player/Controller")

var controller: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node(GRID_PATH).connect("pawn_clicked", self, "_on_Grid_pawn_clicked")
	controller = get_node(START_CONTROLLER_PATH)
	pass # Replace with function body.

func _on_Grid_pawn_clicked(clicked_pawn: Pawn):
	_move_controller_to_pawn(clicked_pawn)

func _move_controller_to_pawn(target_pawn: Pawn):
	var new_controller: Node = preload("res://Scenes/controller/Controller.tscn").instance()
	target_pawn.add_child(new_controller)
	controller.queue_free()
	controller = new_controller

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
