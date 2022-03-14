extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 10000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func input():
	if Input.is_action_pressed("up"):
		apply_central_impulse(Vector2(0,-1*speed))
	if Input.is_action_pressed("down"):
		apply_central_impulse(Vector2(0,1*speed))
	if Input.is_action_pressed("left"):
		apply_central_impulse(Vector2(-1*speed,0))
	if Input.is_action_pressed("right"):
		apply_central_impulse(Vector2(1*speed,0))
		pass
	
func input2():
	if Input.is_action_pressed("up"):
		applied_force = Vector2(0,-1*speed)
	if Input.is_action_pressed("down"):
		applied_force  =Vector2(0,1*speed)
	if Input.is_action_pressed("left"):
		applied_force = Vector2(-1*speed,0)
	if Input.is_action_pressed("right"):
		applied_force = Vector2(1*speed,0)
		pass
	
	
func _process(delta):
	#input()
	input2()
	pass
func _physics_process(delta):
	#input()
	pass

		
func _integrate_forces(state):
	#input2()
	#applied_force = Vector2()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	
	applied_torque = 10000
	pass # Replace with function body.
