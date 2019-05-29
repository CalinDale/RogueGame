extends Node2D

class_name Pawn

enum COLLISION_LAYERS {NONE = 0, NORMAL}
export(COLLISION_LAYERS) var collision = COLLISION_LAYERS.NORMAL

onready var _grid: TileMap = get_parent()

export(int) var _health: int = 10
export(int) var _damage: int = 2 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func check_direction(direction: Vector2) -> void:
	var target = _grid.request_move(self, direction)
	if target is Vector2:
		move_to(target)
	else:
		target.take_damage(_damage)

func move_to(target_position) -> void:
	position = target_position

func take_damage(damage: int) -> void:
	_health -= damage
	print("A pawn took " + str(damage) + " damage, its health is " + str(_health))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
