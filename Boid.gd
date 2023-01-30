extends MeshInstance

export var mass = 1
export var force = Vector3.ZERO
export var acceleration = Vector3.ZERO
export var velocity = Vector3.ZERO
export var speed:float
export var maxSpeed:float
export var target: Vector3
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func Seek(target: Vector3):
	var toTarget = target - transform.origin
	toTarget = toTarget.normalized()
	var desired = toTarget * maxSpeed;
	return desired - velocity

	
func _process(delta):
	acceleration = Seek(target) / mass
	velocity += acceleration * delta
	speed = velocity.length()
	if speed > 0:
		transform.origin += velocity * delta
		
		
