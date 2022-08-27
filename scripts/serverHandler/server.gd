class_name ServerHandler

var server = PacketPeerUDP.new()
var serverIp = "127.0.0.1"
var serverPort = 55580
var peer = PacketPeerUDP.new()

func _init():
	if server.bind(0, serverIp) == OK:
		server.connect_to_host(serverIp, serverPort)
		print("Successfully established connection to host: " + str(serverIp) + " on port: " + str(serverPort))
	else: 
		print("Couldn't establish connection to host: " + str(serverIp))

func putPacket(packet: PackedByteArray):
	server.put_packet(packet)
	print("Sent packet")

func getPacket():
	#Getting packets
	
	var serverPacket = server.get_packet()
	
	return serverPacket
