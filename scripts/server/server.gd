class_name ServerHandler

var server = PacketPeerUDP.new()
var serverIp = "127.0.0.1"
var serverPort = 3000
var peer = PacketPeerUDP.new()

enum PacketType {
	move = 1
}

func _init():
	if server.bind(serverPort, serverIp) == OK:
		print("Listening on port: " + str(serverPort) + " ip: " + str(serverIp))
	else: 
		print("Error trying to connect to server!")

func sendMovePacket(moveDirection: Vector2):
	var packedByte = PackedByteArray([0, PacketType.move, int(moveDirection.x), int(moveDirection.y)])
	server.put_packet(packedByte)
	print(packedByte)
	
