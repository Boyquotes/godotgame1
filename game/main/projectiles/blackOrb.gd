extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var basedamage = 10
var damage = basedamage
var speed = 10000
var delay = 0.5
var trail = "res://main/projectiles/trail.tscn"
var parent 
# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent().get_parent()
	pass # Replace with function body.

func start_at(pos,dir):
	global_position=pos
	rotation=dir

func _physics_process(delta):
	position += transform.x * speed * delta
	leavetrail()

func leavetrail():
	var leftover = load(trail)
	leftover = leftover.instance()
	leftover.start_at(global_position,global_rotation)
	parent.add_child(leftover)
	
func _on_Area2D_area_entered(area):
	if area.is_in_group("hitbox") and !area.is_in_group("player"):
		pass
		#area.take_damage(damage)
	pass # Replace with function body.


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.


func _on_Timer2_timeout():
	#leavetrail()
	pass # Replace with function body.
