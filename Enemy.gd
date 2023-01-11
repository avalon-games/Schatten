extends RigidBody2D

const move_speed = 30
const attack_radius = 80;

var is_moving = false;
var is_attacking = false;

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# https://www.youtube.com/watch?v=jtniiE0_n0w


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.playing = true
	is_moving = true

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _physics_process(delta: float) -> void:
	if Globals.player:
		if is_moving:
			move(delta)

func move(delta):
	var raw_direction = (Globals.player.position - position).normalized()
	var direction = Vector2(int(round(raw_direction.x)),int(round(raw_direction.y)))
	var velocity = direction * move_speed * delta
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
