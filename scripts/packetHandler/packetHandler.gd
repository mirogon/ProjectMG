class_name PacketHandler

var player: Player

enum EPacketTypes {
	registration = 1,
	move = 2,
	characterPosition = 3
}

func _init(player: Player):
	self.player = player
	
func handlePacket(packet: PackedByteArray):
	var packetType = packet.decode_u16(0)
	
	EPacketTypes
	match packetType:
		EPacketTypes.characterPosition:
			var positionX = packet.decode_float(2)
			var positionY = packet.decode_u8(6)
			
			player.setPosition(Vector2(positionX, positionY))
			print("CHARACTERPOSITION PACKET")
		_:
			pass
	

