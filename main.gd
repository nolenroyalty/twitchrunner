extends Node2D

onready var network_client = $NetworkClient
onready var terrain_gen = $TerrainGenerator
onready var player_pos = $Player.position


func handle_terrain_gen(terrain):
	terrain_gen.add_terrain(terrain)

func handle_restart():
	terrain_gen.clear_dynamic_terrain()
	$Player.position = player_pos - Vector2(0, 5)

func _process(_delta):
	if Input.is_action_just_pressed("restart"):
		print('hi')
		handle_restart()

func _ready():
	# network_client.connect_to_server()
	network_client.connect("generate_terrain", self, "handle_terrain_gen")
	network_client.connect("restart", self, "handle_restart")
