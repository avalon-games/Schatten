extends Camera


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
# func _ready():
	
func _physics_process(delta):
	var position = get_viewport().get_mouse_position()
	# if ev is InputEventMouseButton and ev.pressed and ev.button_index == 1:
	var camera = get_node(".")
	var from = camera.project_ray_origin(position)
	var to = from + camera.project_ray_normal(position) * 200
	
	var space_state = get_world().direct_space_state
	var result = space_state.intersect_ray(from, to)
	if result:
		var player = get_node("../../Player")
		var target = result.position
		target.y = player.get_global_translation().y
		player.look_at(target, Vector3.UP)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
