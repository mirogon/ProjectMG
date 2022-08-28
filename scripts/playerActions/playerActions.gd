class_name PlayerActions

var currentDirection = 0

func _init():
	pass


func directionChanged():
	var directionChanged = false
	if Input.is_action_just_pressed("walk_north"): directionChanged = true
	if Input.is_action_just_pressed("walk_south"): directionChanged = true
	if Input.is_action_just_pressed("walk_west"): directionChanged = true
	if Input.is_action_just_pressed("walk_east"): directionChanged = true
	
	if Input.is_action_just_released("walk_north"): directionChanged = true
	if Input.is_action_just_released("walk_south"): directionChanged = true
	if Input.is_action_just_released("walk_west"): directionChanged = true
	if Input.is_action_just_released("walk_east"): directionChanged = true
		
	return directionChanged

func getCurrentMoveDirection():
	var currentDirection = Vector2(0,0)
	var directionChange = directionChanged()
	
	if directionChange == false:
		return null

	if Input.is_action_pressed("walk_north"): currentDirection.y -= 1
	if Input.is_action_pressed("walk_south"): currentDirection.y += 1
	
	if Input.is_action_pressed("walk_east"): currentDirection.x += 1
	if Input.is_action_pressed("walk_west"): currentDirection.x -= 1
	
	return currentDirection

