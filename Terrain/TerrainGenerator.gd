extends Node2D

var Flat = preload("res://terrain/Flat.tscn")
var Slant = preload("res://terrain/Slant.tscn")

var current_position = Vector2(0, 0)
var start_position = current_position

func add_terrain(terrain):
	terrain = terrain.instance()
	terrain.position = current_position + terrain.placement_offset
	print(current_position)
	current_position = current_position + terrain.connection_point
	print(current_position)
	$Dynamic.add_child(terrain)

func clear_dynamic_terrain():
	for child in $Dynamic.get_children():
		child.queue_free()
	current_position = start_position

func _process(_delta):
	if Input.is_action_just_pressed("add_flat"):
		add_terrain(Flat)
	if Input.is_action_just_pressed("add_slant"):
		add_terrain(Slant)

func _ready():
	current_position = $StartingPoint.position
	start_position = current_position