extends Spatial

export var speed = 10.0
export var rotSpeed = 5.0


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _drawGizmos():
	DebugDraw.draw_line(transform.origin,  transform.origin + transform.basis.z * 10.0 , Color(0, 0, 1))
	DebugDraw.draw_line(transform.origin,  transform.origin + transform.basis.x * 10.0 , Color(1, 0, 0))
	DebugDraw.draw_line(transform.origin,  transform.origin + transform.basis.y * 10.0 , Color(0, 1, 0))
	DebugDraw.set_text("transform.origin: ", transform.origin)
	DebugDraw.set_text("translation: ", translation)
	DebugDraw.set_text("rotation: ", rotation)
	DebugDraw.set_text("rotation_degrees: ", rotation_degrees)
	DebugDraw.set_text("transform.basis.x: ", transform.basis.x)
	DebugDraw.set_text("transform.basis.y: ", transform.basis.y)
	DebugDraw.set_text("transform.basis.z: ", transform.basis.z)

	DebugDraw.set_text("Vector3.FORWARD: ", Vector3.FORWARD)
	DebugDraw.set_text("Vector3.BACK: ", Vector3.BACK)
	DebugDraw.set_text("Vector3.UP: ", Vector3.UP)
	DebugDraw.set_text("Vector3.DOWN: ", Vector3.DOWN)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):		
	
	var turn = Input.get_axis("move_left", "move_right")
	DebugDraw.set_text("turn: ", str(turn))
	
	if abs(turn) > 0:     
		rotation.y += rotSpeed * delta * turn
	
	
	var move = Input.get_axis("move_forward", "move_back")
	DebugDraw.set_text("move: ", str(move))
	
	if abs(move) > 0:     		
		translate(Vector3.FORWARD * speed * delta * move)		
	
	_drawGizmos()
	
	
