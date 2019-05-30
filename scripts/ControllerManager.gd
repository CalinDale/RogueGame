extends Node

# Declare member variables here.
const GRID_PATH: NodePath = NodePath("../Grid")
const START_CONTROLLER_PATH: NodePath = NodePath("../Grid/Player/Controller")

onready var nav_2d: Navigation2D = get_parent()
onready var line_2d: Line2D = $Line2D

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

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("secondary_click"):
		var new_path = nav_2d.get_simple_path(controller.global_position, $"../Grid".get_global_mouse_position())
		line_2d.points = new_path
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
