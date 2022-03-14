extends KinematicBody2D


var velocity = Vector2()
var movementBlocker = false
var speed = 30000
var mause
var starthp = 100
var hp = starthp
var attackspeed = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start_at(posx,posy):
	position.x = posx
	position.y = posy

func getinput():
	#weapon.rotation = lerp_angle(weapon.rotation ,mause.angle_to_point(weapon.global_position) , rotation_speed * zed  )
	velocity = Vector2()
	if Input.is_action_pressed('down') and movementBlocker == false:
		velocity.y += 100
	if Input.is_action_pressed('up') and movementBlocker == false:
		velocity.y -= 100
	if Input.is_action_pressed('right') and movementBlocker == false:
		velocity.x += 120
	if Input.is_action_pressed('left') and movementBlocker == false:
		velocity.x -= 120
	velocity = velocity.normalized() * speed
	mause = get_global_mouse_position()
	$body/Position2D.look_at(mause)
	if (position.x - mause.x)> 0 :
		$body.scale.x = -1
	elif (position.x - mause.x)< 0 :
		$body.scale.x = 1		

func _input(event):
	var zoom = 0.3
	if event.is_action_pressed('scroll_up') and $Camera2D.zoom.x > 0.2:
		$Camera2D.zoom = $Camera2D.zoom - Vector2(zoom, zoom)
	if event.is_action_pressed('scroll_down'):
		$Camera2D.zoom = $Camera2D.zoom + Vector2(zoom, zoom)

func _physics_process(delta):
	getinput()
	velocity = move_and_slide(velocity)
	
	
