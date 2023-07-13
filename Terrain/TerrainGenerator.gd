extends Node2D

var Flat = preload("res://terrain/Flat.tscn")
var Slant = preload("res://terrain/Slant.tscn")

var current_position = Vector2(0, 0)

func add_terain(terrain):
	terrain = terrain.instance()
	terrain.position = current_position + terrain.placement_offset
	print(current_position)
	current_position = current_position + terrain.connection_point
	print(current_position)
	add_child(terrain)

func _process(_delta):
	if Input.is_action_just_pressed("add_flat"):
		add_terain(Flat)
	if Input.is_action_just_pressed("add_slant"):
		add_terain(Slant)

func _ready():
	current_position = $StartingPoint.position
