extends Node

# Declare member variables here. Examples:
onready var Grid: TileMap = $Nav/Grid
onready var Nav: Navigation2D = $Nav
onready var GridClicker: Node = $GridClicker

#Temp
onready var PlayerController: Node = $Nav/Grid/Player/Controller

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
