extends KinematicBody2D

var start_hp = 10
var hp = start_hp
var placed=false
var id = 0
var status = "alive"
var parent

func _ready():
	parent = get_parent().get_parent()
	pass # Replace with function body.
	
func start_at(posx,posy):
	position.x = posx
	position.y = posy
	
func place(value):
	placed = value

func take_damage(amount):
	hp-= amount
	if hp<= 0:
		print(id,"e")
		status="dead"
		#emit_signal("died",id)
		parent.remover(id)
		#queue_free()



func _on_hitbox_area_entered(area):
	if area.is_in_group("damagebox"):
		take_damage(area.damage)
	pass # Replace with function body.
