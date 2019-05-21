extends Camera2D

var _zoom_amount = 0.1
var _zoom_default = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _unhandled_input(event):
	if event is InputEventMouseButton:
		_handle_zoom_input(event)

func _handle_zoom_input(event: InputEventMouseButton):
	if event.is_pressed():
		if Input.is_action_just_pressed("zoom_in"):
			_zoom_in()
		elif Input.is_action_just_pressed("zoom_out"):
			_zoom_out()
		elif Input.is_action_just_pressed("zoom_in"):
			_zoom_reset()

func _zoom_in():
	if zoom.x - _zoom_amount > 0 + _zoom_amount:
		zoom.x -= _zoom_amount
		zoom.y -= _zoom_amount

func _zoom_out():
	zoom.x += _zoom_amount
	zoom.y += _zoom_amount

func _zoom_reset():
	zoom.x = _zoom_default
	zoom.y = _zoom_default

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
