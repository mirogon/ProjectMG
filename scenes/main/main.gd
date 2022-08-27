extends Node2D

class_name main_scene

var playerScene: PackedScene = preload("res://scenes/player/Player.tscn")

var serverHandler: ServerHandler
var packetHandler: PacketHandler

var thread: Thread
var activeProcess = true

# Called when the node enters the scene tree for the first time.
func _ready():
	serverHandler = ServerHandler.new() 
	packetHandler = PacketHandler.new($Player)
	$Player.serverHandler = serverHandler
	serverHandler.putPacket(PackedByteArray([0, packetHandler.EPacketTypes.registration]))
	print("Sent register")
	thread = Thread.new()
	thread.start(_packet_handler_thread, null, Thread.PRIORITY_NORMAL)


func _packet_handler_thread():
	print("ThreadStart")
	while activeProcess:
		var packet = serverHandler.getPacket()
		if packet.size() == 0: continue

		packetHandler.handlePacket(packet)


func _exit_tree():
	activeProcess = false
	thread.wait_to_finish()
