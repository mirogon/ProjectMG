class_name PlayerActions


class Direction:
	var north: bool = false
	var south: bool = false
	var west: bool = false
	var east: bool = false

	func trueNumber():
		var directionNumber = 0
		
		if east:
			directionNumber = 3
		if west:
			directionNumber = 7
			
		if north:
			directionNumber = 1
			
			if east:
				directionNumber = 2
			elif west:
				directionNumber = 8
		
		if south:
			directionNumber = 5
			
			if east:
				directionNumber = 4
			elif west:
				directionNumber = 6
		
		return directionNumber

var currentDirection = 0

func _init():
	pass


func  directionChanged():
	var directionChanged = false
	if Input.is_action_just_pressed("walk_north"):
		directionChanged = true
	if Input.is_action_just_pressed("walk_south"):
		directionChanged = true
	if Input.is_action_just_pressed("walk_west"):
		directionChanged = true
	if Input.is_action_just_pressed("walk_east"):
		directionChanged = true
	
	if Input.is_action_just_released("walk_north"):
		directionChanged = true
	if Input.is_action_just_released("walk_south"):
		directionChanged = true
	if Input.is_action_just_released("walk_west"):
		directionChanged = true
	if Input.is_action_just_released("walk_east"):
		directionChanged = true
		
	return directionChanged
	

func getCurrentMoveDirection():
	var currentDirection = Vector2(0,0)
	var directionChange = directionChanged()
	
	if directionChange == false:
		return null

	if Input.is_action_pressed("walk_north"):
		currentDirection.y += 1
	
	if Input.is_action_pressed("walk_south"):
		currentDirection.y -= 1
	
	if Input.is_action_pressed("walk_east"):
		currentDirection.x += 1
		
	if Input.is_action_pressed("walk_west"):
		currentDirection.x -= 1
	
	return currentDirection

