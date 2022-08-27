class_name ServerHandler

var server = PacketPeerUDP.new()
var serverIp = "127.0.0.1"
var serverPort = 55580
var peer = PacketPeerUDP.new()

enum PacketType {
	move = 1
}

func _init():
	if server.bind(0, serverIp) == OK:
		server.connect_to_host(serverIp, serverPort)
		print("Successfully established connection to host: " + str(serverIp) + " on port: " + str(serverPort))
	else: 
		print("Couldn't establish connection to host: " + str(serverIp))

func sendMovePacket(moveDirection: Vector2):
	var clientPacket = PackedByteArray([0, PacketType.move, int(moveDirection.x), int(moveDirection.y)])
	server.put_packet(clientPacket)
	print("Sent packet")
	

func receiveMovePacket():
	var serverPacket = server.get_packet()
	
	print(serverPacket)
