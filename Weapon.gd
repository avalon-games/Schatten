extends KinematicBody


var immediate_geometry

func _ready():
	immediate_geometry = ImmediateGeometry.new()
	get_tree().get_root().call_deferred("add_child", immediate_geometry)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if Input.is_action_pressed("attack"):
		$SwordAnimator.play("Swing")
	var pos1 = get_node("./Position3D/Sword Pivot").get_global_translation()
	var pos2 = get_node("./Position3D/Tip").get_global_translation()

	# for debugging, use the following line (will not be visible if overlapped by the 
	# line(pos1, pos2)


func line(pos1: Vector3, pos2: Vector3, color = Color.white):
	immediate_geometry.clear()
	immediate_geometry.begin(Mesh.PRIMITIVE_LINES)
	immediate_geometry.set_color(color)
	immediate_geometry.add_vertex(pos1)
	immediate_geometry.set_color(color)
	immediate_geometry.add_vertex(pos2)
	immediate_geometry.end()	
	
