extends KinematicBody

# How fast the player moves in meters per second.
export var speed = 14
# The downward acceleration when in the air, in meters per second squared.
export var fall_acceleration = 75

var velocity = Vector3.ZERO

onready var player_animator = get_node("Pivot/KidActions/AnimationPlayer");
#use the bool to block attacking again while attacking
var is_attacking:bool = false;

func _ready():
	player_animator.connect("animation_finished",self,"reset_attack");

func reset_attack(anim_name: String):
	if anim_name == "SideSwing":
		is_attacking = false;

func _physics_process(delta):
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
	
	if Input.is_action_pressed("attack") and !is_attacking:
		player_animator.play("SideSwing");
		is_attacking = true;
	# Make the player look at the direction they are moving at:
	# if direction != Vector3.ZERO:
		# direction = direction.normalized()
		# $Pivot.look_at(translation + direction, Vector3.UP)

	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	velocity.y -= fall_acceleration * delta
	velocity = move_and_slide(velocity, Vector3.UP)

		
