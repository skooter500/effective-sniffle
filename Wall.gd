extends Spatial



# Declare member variables here. Examples:

export var width = 10
export var height = 10

export (PackedScene) var brickScene

# Called when the node enters the scene tree for the first time.
func _ready():	
	
	var half = width / 2
	for j in height:
		for i in width:				
			var brick = brickScene.instance()
			var pos = Vector3(i - half, 1 + j, 0)
			brick.transform.origin = pos
			var mi  = brick.get_node("MeshInstance").get_surface_material(0)
			# mi.material.albedo_color = Color(randf(), randf(), randf())
			# material.set_surface_material(0, material)
			add_child(brick)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
