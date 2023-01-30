extends Spatial

export var mass = 1
export var force = Vector3.ZERO
export var acceleration = Vector3.ZERO
export var velocity = Vector3.ZERO
export var speed:float
export(float) var maxSpeed = 10.0

export var seekEnabled = true
export var seekTarget: Vector3

export var targetNode: NodePath

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _drawGizmos():
	# DebugDraw.draw_box(box_pos, Vector3(10, 20, 10), Color(0, 1, 0))
	DebugDraw.draw_line(transform.origin,  seekTarget , Color(1, 1, 0))
	# DebugDraw.set_text("Time", time)
	# DebugDraw.set_text("Frames drawn", Engine.get_frames_drawn())
	# DebugDraw.set_text("FPS", Engine.get_frames_per_second())
	# DebugDraw.set_text("delta", delta)


# Called when the node enters the scene tree for the first time.
func _ready():
	seekTarget = get_node(targetNode).transform.origin
	print("Seek Target in ready" + str(seekTarget))


func _seek(target: Vector3):	
	var toTarget = target - transform.origin
	toTarget = toTarget.normalized()
	var desired = toTarget * maxSpeed;
	return desired - velocity

func _calculate():
	var f = Vector3.ZERO
	if seekEnabled:
		f += _seek(seekTarget)
	return f
	
func _process(delta):
	acceleration = _calculate() / mass
	velocity += acceleration * delta
	speed = velocity.length()
	if speed > 0:
		# To move a Spatial use any of these:
		# transform.origin += velocity * delta
		# translation += velocity * delta 		
		translate(velocity * delta)
		var theta = Vector3.FORWARD.angle_to(velocity)
		# print(theta)
		# rotation = Vector3(0, theta, 0)
		# rotate_y(theta)
		# transform.origin += velocity * delta
		# look_at()
	_drawGizmos()	
		
