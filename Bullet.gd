extends MeshInstance


# Declare member variables here. Examples:
export var speed = 1.0
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(Vector3.LEFT, speed * delta)
	pass
	
