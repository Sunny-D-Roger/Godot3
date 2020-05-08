extends RigidBody2D

export (int) var MIN_SPEED
export (int) var MAX_SPEED
var mob_types = ["walk", "swim", "fly", "horror", "mo"]
var horr = ["horror", "mo"]
func _ready():
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]

func for_horror():
	$AnimatedSprite.animation = horr[rotate(360)]

func _on_Visibility_screen_entered():
	if "horr":
		$ghost.play()
