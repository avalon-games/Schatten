extends KinematicBody

# How fast the player moves in meters per second.
export var speed = 14
# The downward acceleration when in the air, in meters per second squared.
export var fall_acceleration = 75

var velocity = Vector3.ZERO

func _physics_process(delta):
	movePlayer(delta);
	
func movePlayer(delta):
	# We create a local variable to store the input direction.
	var direction = Vector3.ZERO

	# We check for each move input and update the direction accordingly.
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_down"):
		# Notice how we are working with the vector's x and z axes.
		# In 3D, the XZ plane is the ground plane.
		direction.z += 1
	if Input.is_action_pressed("move_up"):
		direction.z -= 1
	
	# Make the player look at the direction they are moving at:
	# if direction != Vector3.ZERO:
		# direction = direction.normalized()
		# $Pivot.look_at(translation + direction, Vector3.UP)

	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	velocity.y -= fall_acceleration * delta
	velocity = move_and_slide(velocity, Vector3.UP)
	
func _physics_process(delta):
	var lightsource = get_node("../OmniLight")
	var swordPivot = get_node("./Sword Pivot")
	var swordTip = get_node("./Sword Pivot/SwordTip")
	var from = lightsource.get_global_translation();
	var to = from + (swordPivot.position - from) * 200
	
	var space_state = get_world().direct_space_state
	var result = space_state.intersect_ray(from, to)
	if result:
		var player = get_node("../../Player")
		var target = result.position
		target.y = player.get_global_translation().y
		player.look_at(target, Vector3.UP)
