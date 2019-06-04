class tileData:
	var name: String = "UNNAMED_TILE"
	var collision: bool = false
	
	func _init(in_name: String, in_collision: bool):
		name = in_name
		collision = in_collision

var tiles: Dictionary

func setup():
	tiles = {
		-1 : tileData.new("NULLTILE", false),
		0 : tileData.new("cobblestone_wall", true),
		1 : tileData.new("grass", true)
		}