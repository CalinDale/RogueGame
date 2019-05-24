extends TileMap

onready var Obstacle: PackedScene = preload("res://Scenes/obstacle/Obstacle.tscn")

var tile_size: Vector2 = get_cell_size()
var half_tile_size: Vector2 = tile_size / 2

var _grid: Dictionary = {}

class CellData:
	var collision_counts: Array = []
	var pawns: Array = []
	
	func _init():
		for i in Pawn.COLLISION_LAYERS:
			collision_counts.append(0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	_setup_children()
	_setup_obstacles()

func _setup_children() -> void:
	for child in get_children():
		if child is Pawn:
			_add_pawn(world_to_map(child.position), child)
		
func _add_pawn(position: Vector2, pawn: Pawn) -> void:
	if !_grid.get(position):
		_grid[position] = CellData.new()
	var cell: CellData = _grid[position]
	cell.pawns.append(pawn)
	cell.collision_counts[pawn.collision] += 1 
	
func _remove_pawn(position: Vector2, pawn: Pawn) -> void:
	_grid[position].pawns.erase(pawn)
	_grid[position].collision_counts[pawn.collision] -= 1
	
func _update_pawn_position(pawn: Pawn, cell_start: Vector2, cell_target: Vector2) -> Vector2:
	_add_pawn(cell_target, pawn)
	_remove_pawn(cell_start, pawn)
	return map_to_world(cell_target) + cell_size / 2

func _setup_obstacles() -> void:
	var positions = []
	for n in range(5):
		var grid_pos: Vector2 = Vector2(randi() % 15, randi() % 15)
		if not grid_pos in positions:
			positions.append(grid_pos)
			
	for pos in positions:
		_place_scene(Obstacle, pos)

func _place_scene(scene: PackedScene, position: Vector2) -> void:
	var new_scene: Node = scene.instance()
	add_child(new_scene)
	new_scene.position = (map_to_world(position) + half_tile_size)
	_add_pawn(position, new_scene)

func request_move(pawn: Pawn, direction: Vector2):
	var cell_start: Vector2 = world_to_map(pawn.position)
	var cell_target: Vector2 = cell_start + direction
	# return _update_pawn_position(pawn, cell_start, cell_target)
	# Replace following with real collision check
	
	if !_grid.get(cell_target):
		return _update_pawn_position(pawn, cell_start, cell_target)
	elif pawn.collision == Pawn.COLLISION_LAYERS.NONE:
		return _update_pawn_position(pawn, cell_start, cell_target)
	elif _grid.get(cell_target).collision_counts[pawn.collision] == 0:
		return _update_pawn_position(pawn, cell_start, cell_target)
	else:
		return null

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
