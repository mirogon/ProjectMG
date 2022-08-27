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
	var packetType = packet.decode_u8(1)
	#print(packetType)
	match packetType:
		EPacketTypes.characterPosition:
			var positionX = packet.decode_float(2)
			var positionY = packet.decode_float(6)
			#print(positionX)
			player.setPosition(Vector2(positionX, positionY))

		_:
			pass
	

