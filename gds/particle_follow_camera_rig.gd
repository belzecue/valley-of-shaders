extends Particles

export var terrain_height = 64
export var rows = 32
export var spacing = 4.0
var size = rows * spacing

func update_aabb():
	
	visibility_aabb = AABB(
		Vector3(-0.5 * size, 0.0, -0.5 * size), #x,y,z
		Vector3(size, terrain_height, size)) #w,up,h;

func _ready():
	update_aabb()

func _process(delta):
	# Center our particles on our cameras position
	var viewport = get_viewport()
	var camera = viewport.get_camera()

	var pos = camera.global_transform.origin
	pos.y = 0.0

	global_transform.origin = pos