extends Node2D

class_name Pawn

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum COLLISION_LAYERS {NONE = 0, NORMAL}

export(COLLISION_LAYERS) var collision = COLLISION_LAYERS.NORMAL

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass