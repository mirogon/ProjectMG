extends KinematicBody2D

var server = PacketPeerUDP.new()
var serverIp = "127.0.0.1"
var serverPort = 3000

class Direction:
	var north: bool = false
	var south: bool = false
	var west: bool = false
	var east: bool = false
	
func _ready():
	connectServer()

func _physics_process(delta):
	move()

func connectServer():
	if server.listen(serverPort, serverIp) == OK:
		print("Listening on port: " + str(serverPort) + " ip: " + str(serverIp))
	else: 
		print("Error trying to connect to server!")
		

func move():
	var direction = getMoveDirection()
	
	print(direction.north)
	
func sendMovePacket(direction: Direction):
	server.put_packet(direction)

func getMoveDirection():
	var direction: Direction = Direction.new()
	
	if Input.is_action_pressed("walk_north"):
		direction.north = true
	else:
		direction.north = false
	
	if Input.is_action_pressed("walk_south"):
		direction.south = true
	else:
		direction.south = false
		
	if Input.is_action_pressed("walk_west"):
		direction.west = true
	else:
		direction.west = false
	
	if Input.is_action_pressed("walk_east"):
		direction.east = true
	else:
		direction.east = false

	return direction


