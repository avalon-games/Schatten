extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
# cast ray towards the player's sword base and tip
# continue travelling until it hits the ground
# draw a raycast between the two points on the ground
# while swinging, keep an array of enemies hit during the swing,
# if not already in the array, deal dmg and add to array
