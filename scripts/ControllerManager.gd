extends Node

# Declare member variables here.
#const GRID_PATH: NodePath = NodePath("../Grid")
#const START_CONTROLLER_PATH: NodePath = NodePath("../Grid/Player/Controller")

onready var GridManager: Node = $"../GridManager"

#onready var nav_2d: Navigation2D = get_parent()
onready var line_2d: Line2D = $"../Line2D"

var controller: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	GridManager.GridClicker.connect("pawn_clicked", self, "_on_GridClicker_pawn_clicked")
	GridManager.GridClicker.connect("cell_clicked", self, "_on_GridClicker_cell_clicked")
	controller = GridManager.PlayerController
	pass # Replace with function body.

func _on_GridClicker_pawn_clicked(clicked_pawn: Pawn) -> void:
	print("pawn_clicked")
	_move_controller_to_pawn(clicked_pawn)

func _move_controller_to_pawn(target_pawn: Pawn) -> void:
	var new_controller: Node = preload("res://Scenes/controller/Controller.tscn").instance()
	target_pawn.add_child(new_controller)
	controller.queue_free()
	controller = new_controller

func _on_GridClicker_cell_clicked(cell: Vector2) -> void:
	var new_path = $"../GridManager/Nav".get_simple_path(controller.global_position, $"../GridManager/Nav/Grid".get_global_mouse_position())
	print("cell_clicked" + str(cell))
	line_2d.points = new_path
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
