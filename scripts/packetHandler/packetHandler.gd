class_name PacketHandler

enum EPacketTypes {
	move = 1,
	characterPosition = 2
}

func _init():
	pass
	
func handlePacket(packet: PackedByteArray):
	var packetType = packet.decode_u16(0)
	
	EPacketTypes
	match packetType:
		EPacketTypes.characterPosition:
			print("CHARACTERPOSITION PACKET")
		_:
			pass
	

