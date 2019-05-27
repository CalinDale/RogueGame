extends Node2D

class_name Pawn

enum COLLISION_LAYERS {NONE = 0, NORMAL}
export(COLLISION_LAYERS) var collision = COLLISION_LAYERS.NORMAL

onready var _grid: TileMap = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func check_direction(direction: Vector2) -> void:
	var target_position: Vector2 = _grid.request_move(self, direction)
	if target_position:
		move_to(target_position)

func move_to(target_position) -> void:
	position = target_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
