extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_contact_monitor(true)
	set_max_contacts_reported(2)
	
	connect("body_enter", self, "_on_body_enter")
	pass

func _on_body_enter(body):
	print (body.get_name())
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
