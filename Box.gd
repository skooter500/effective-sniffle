extends Spatial

export var speed = 2.0
export var rotSpeed = 5.0


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):		
	if Input.is_action_pressed("ui_up"):    
		print("up")
		transform.origin += transform.basis.z * speed * delta;
	if Input.is_action_pressed("ui_down"):    
		transform.origin -= transform.basis.z * speed * delta;
	if Input.is_action_pressed("ui_left"):    
		rotate(Vector3.UP, rotSpeed * delta)
	if Input.is_action_pressed("ui_right"):    
		rotate(Vector3.UP, - rotSpeed * delta)
	
	
