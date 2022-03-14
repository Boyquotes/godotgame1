extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var placed=false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func start_at(posx,posy):
	position.x = posx
	position.y = posy
	
func place(value):
	placed = value

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
