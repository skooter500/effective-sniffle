extends Spatial

onready var target = get_node("Box/target")
onready var cam = get_node("Camera")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Target: ", target.global_translation)
	print("Camera: ", cam.global_translation)

	# pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# transform.origin += transform.basis.z
	cam.global_translation = lerp(cam.global_translation, target.global_translation, delta)
	cam.look_at(cam.get_parent_spatial().global_translation, Vector3.UP)
	# pass
