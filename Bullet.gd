extends MeshInstance


# Declare member variables here. Examples:
export var speed = 1.0
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _drawGizmos():
	var time = OS.get_ticks_msec() / 1000.0
	var box_pos = Vector3(0, sin(time * 4.0), 0)
	var line_begin = Vector3(-1, sin(time * 4.0), 0)
	var line_end = Vector3(1, cos(time * 4.0), 0)

	DebugDraw.draw_box(box_pos, Vector3(1, 2, 1), Color(0, 1, 0))
	DebugDraw.draw_line(line_begin, line_end, Color(1, 1, 0))
	DebugDraw.set_text("Time", time)
	DebugDraw.set_text("Frames drawn", Engine.get_frames_drawn())
	DebugDraw.set_text("FPS", Engine.get_frames_per_second())
	# DebugDraw.set_text("delta", delta)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(Vector3.LEFT, speed * delta)
	_drawGizmos()
	pass
	
