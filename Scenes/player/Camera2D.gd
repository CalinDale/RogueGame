extends Camera2D

export(float) var _zoom_amount: float = 0.1
export(float) var _zoom_default: float = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
		_handle_zoom_input(event)

func _handle_zoom_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("zoom_in"):
		_zoom_in()
	elif Input.is_action_just_pressed("zoom_out"):
		_zoom_out()
	elif Input.is_action_just_pressed("zoom_reset"):
		_zoom_reset()

func _zoom_in() -> void:
	if zoom.x - _zoom_amount > 0 + _zoom_amount:
		zoom.x -= _zoom_amount
		zoom.y -= _zoom_amount

func _zoom_out() -> void:
	zoom.x += _zoom_amount
	zoom.y += _zoom_amount

func _zoom_reset() -> void:
	zoom.x = _zoom_default
	zoom.y = _zoom_default

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
