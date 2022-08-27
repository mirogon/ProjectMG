extends CharacterBody2D

class_name Player


var serverHandler: ServerHandler
var playerActions = PlayerActions.new()

func _ready():
	pass

func _physics_process(delta):
	move()

func move():
	var moveDirection = playerActions.getCurrentMoveDirection()
	if moveDirection != null:
		var packetType = PacketHandler.EPacketTypes.move
		var packet = PackedByteArray([0, int(packetType), int(moveDirection.x), int(moveDirection.y)])
		serverHandler.putPacket(packet)
		

func setPosition(position: Vector2):
	self.position = position
	

