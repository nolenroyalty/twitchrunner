extends Node2D

var Flat = preload("res://terrain/Flat.tscn")
var Slant = preload("res://terrain/Slant.tscn")

signal generate_terrain(terrain)
signal restart()
var server := UDPServer.new()

func _ready():
	var _ignore = server.listen(31337)

func _process(_delta):
	var _ignore = server.poll()
	if server.is_connection_available():
		print("conn available")
		var peer : PacketPeerUDP = server.take_connection()
		var pkt = peer.get_packet()
		print("Accepted peer: %s:%s" % [peer.get_packet_ip(), peer.get_packet_port()])	
		print("Received data: %s" % [pkt.get_string_from_utf8()])
		process_message(pkt.get_string_from_utf8())
		peer.put_packet(pkt)

func process_message(message : String):
	message = message.strip_edges()
	if message == "-" or message == "_":
		emit_signal("generate_terrain", Flat)
	elif message == "/" or message == "\\":
		emit_signal("generate_terrain", Slant)
	elif message == "r" or message == "R":
		emit_signal("restart")
	else:
		print("Unknown message: %s" % [message])
