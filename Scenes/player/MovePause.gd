extends Timer

export(float) var _timer_min: float = 0.05
export(float) var _speedup: float = 0.1

var _default_wait_time: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_default_wait_time = wait_time
	pass # Replace with function body.
	
func reset() -> void:
	wait_time = _default_wait_time
	stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MovePause_timeout() -> void:
	if wait_time - _speedup < _timer_min:
		wait_time = _timer_min
	else:
		wait_time -= _speedup
