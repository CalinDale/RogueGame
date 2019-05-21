extends Timer

var movePauseMax = 0.4
var movePauseMin = 0.05
var movePauseSpeedup = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	wait_time = movePauseMax
	pass # Replace with function body.
	
func reset():
	wait_time = movePauseMax
	stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MovePause_timeout():
	if wait_time - movePauseSpeedup < movePauseMin:
		wait_time = movePauseMin
	else:
		wait_time -= movePauseSpeedup
