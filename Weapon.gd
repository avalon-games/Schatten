extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var lightsource
var swordPivot
var swordTip
var player
var space_state

func _ready():
	lightsource = $"../../../OmniLight"
	player = $"../../../Player"
	swordPivot = $"./Position3D/Sword Pivot"
	swordTip = $"./Position3D/Sword Pivot/SwordTip"
	space_state = get_world().direct_space_state

func _process(_delta):
	
	if Input.is_action_pressed("attack"):
		deal_damage()
		$SwordAnimator.play("Swing")
		

#
# get the light source position
# get sword position
# draw a line from light source position to swrod pivot position
# then from sword pivot to the ground, and sword tip to the ground
# if on the ground, the intersection between the two dots hit an enemy,
# deal damage if not already hit during the current swing
# need global translations for tip, pivot
func deal_damage():
	# cast ray from pivot to ground
	var pivot_to = swordPivot.get_global_translation() + (swordPivot.get_global_translation() - lightsource.get_global_translation()).normalized() * 50
	var pivot_ray = space_state.intersect_ray(swordPivot.get_global_translation(), pivot_to,[player])
	assert(pivot_ray != null) #make sure it hit the ground
	#get position for where the ray hits the ground
	var pivot_shadow_pos = pivot_ray.position 
	print('pivot',pivot_shadow_pos)
	
	# cast ray from swordTip to ground
	var tip_to = swordTip.get_global_translation() + (swordTip.get_global_translation() - lightsource.get_global_translation()).normalized() * 50
	var tip_ray = space_state.intersect_ray(swordTip.get_global_translation(), tip_to,[player])
	assert(tip_ray != null)
	var tip_shadow_pos = tip_ray.position
	print('tip',tip_shadow_pos)
	
	
		
