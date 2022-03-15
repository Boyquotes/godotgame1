extends Sprite

var placed=false
var id
var status = "block"
func start_at(posx,posy):
	position.x = posx
	position.y = posy
	
func place(value):
	placed = value

