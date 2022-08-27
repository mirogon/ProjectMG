extends Node2D
var playerScene: PackedScene = preload("res://scenes/player/Player.tscn")

var serverHandler = ServerHandler.new() 
var packetHandler = PacketHandler.new(playerScene.instantiate())

var thread: Thread
var activeProcess = true

# Called when the node enters the scene tree for the first time.
func _ready():
	thread = Thread.new()
	thread.start(_packet_handler_thread, Thread.PRIORITY_NORMAL)


func _packet_handler_thread():
	while activeProcess:
		var packet = serverHandler.getPacket()
		if packet.size() == 0: continue
			
		packetHandler.handlePacket(packet)


func _exit_tree():
	activeProcess = false
	thread.wait_to_finish()
