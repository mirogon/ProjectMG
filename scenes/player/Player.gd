extends CharacterBody2D

var serverHandler = ServerHandler.new()
var playerActions = PlayerActions.new()

func _ready():
	pass

func _physics_process(delta):
	move()

func move():
	var moveDirection = playerActions.getCurrentMoveDirection()
	
	if moveDirection != null:
		serverHandler.sendMovePacket(moveDirection)
	

