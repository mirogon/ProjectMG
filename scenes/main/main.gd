extends Node2D

var serverHandler = ServerHandler.new()
var packetHandler = PacketHandler.new()
var thread: Thread
var activeProcess = true

# Called when the node enters the scene tree for the first time.
func _ready():
	thread = Thread.new()
	
	thread.start(_packet_handler, Thread.PRIORITY_NORMAL)
	pass # Replace with function body.


func _packet_handler():
	while activeProcess:
		var packet = serverHandler.getPacket()
		if packet.size() == 0: continue
			
		packetHandler.handlePacket(packet)


func _exit_tree():
	activeProcess = false
	thread.wait_to_finish()
