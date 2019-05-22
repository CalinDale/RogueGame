extends TileMap

var tile_size = get_cell_size()
var half_tile_size = tile_size / 2

var _grid = {}

onready var Obstacle = preload("res://Scenes/obstacle/Obstacle.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	_setup_children()
	_setup_obstacles()

func _setup_children():
	for child in get_children():
		_grid[world_to_map(child.position)] = child

func _setup_obstacles():
	var positions = []
	for n in range(5):
		var grid_pos = Vector2(randi() % 15, randi() % 15)
		if not grid_pos in positions:
			positions.append(grid_pos)
			
	for pos in positions:
		_place_scene(Obstacle, pos)

func _place_scene(Scene, position):
	var new_scene = Scene.instance()
	add_child(new_scene)
	new_scene.position = (map_to_world(position) + half_tile_size)
	_grid[position] = new_scene

func request_move(pawn, direction):
	var cell_start = world_to_map(pawn.position)
	var cell_target = cell_start + direction
	# Replace following with real collision check
	if !_grid.get(cell_target):
		return _update_pawn_position(pawn, cell_start, cell_target)
	else:
		return null

	#Rework when multiple pawns can sit on same cell.
func _update_pawn_position(pawn, cell_start, cell_target) -> Vector2:
	_grid.erase(cell_start)
	_grid[cell_target] = pawn
	return map_to_world(cell_target) + cell_size / 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
