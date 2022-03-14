extends Node2D

var block = "res://main/block1.tscn"
var player = "res://main/player/playerKinematic.tscn"
var blockarr = []
var rng = RandomNumberGenerator.new()


func _ready():
	spawnplayer()
	spawnblock()
	distanceChecker(7000)
	pass # Replace with function body.

func spawnplayer():
	player = load(player)
	player = player.instance()
	player.start_at(0,0)
	$YSort.add_child(player)
	pass

func spawnblock():
	rng.randomize()
	var block2 = load(block)
	var lowblock = -100000
	var highblock = 100000
	var leap = 1500
	for i in range(lowblock,highblock,leap):
		for j in range(lowblock,highblock,leap):
			var block3 = block2.instance()
			var x = rng.randi_range(lowblock,highblock)
			var y = rng.randi_range(lowblock,highblock)
			block3.start_at(x,y) 
			blockarr.append(block3)
			#$YSort.add_child(block3)

func checkIfItsClose(x,y,x2,y2,distance):
	#var distance = 1000
	if (x-x2)< distance and (x-x2)>-distance and (y-y2)< distance and (y-y2)>-distance:
		return true
	else:
		return false
		
func distanceChecker(distance):
	var playerpos = player.position
	print(len(blockarr))
	blockarr.shuffle()
	var blocktemp = blockarr
	var erasedIndexes = []
	for i in range(len(blocktemp)):
		var blockpos = blocktemp[i].position
		if checkIfItsClose(playerpos.x,playerpos.y,blockpos.x,blockpos.y ,distance)==true and blocktemp[i].placed == false:
			$YSort.add_child(blocktemp[i])
			blocktemp[i].place(true)
			#erasedIndexes.append(i)
			#blockarr.remove(i)
	#for i in range(len(erasedIndexes)):
	#	blockarr.remove(erasedIndexes[i])
		
		pass
func distanceRemover(distance):
	var playerpos = player.position
	var blocktemp = blockarr
	for i in range(len(blocktemp)):
		var blockpos = blocktemp[i].position
		if checkIfItsClose(playerpos.x,playerpos.y,blockpos.x,blockpos.y ,distance)==false and blocktemp[i].placed == true:
			$YSort.remove_child(blocktemp[i])
			blocktemp[i].place(false)
	
	pass

func _on_Timer_timeout():
	distanceChecker(5000)
	#distanceRemover(5000)
	pass # Replace with function body.


func _on_Timer2_timeout():
	distanceRemover(10000)
	pass # Replace with function body.
