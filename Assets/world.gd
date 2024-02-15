extends Node2D

@onready var polygon_2D = $StaticBody2D/CollisionPolygon2D/Polygon2D
@onready var collision_polygon_2d = $StaticBody2D/CollisionPolygon2D
@onready var level_completed = $"CanvasLayer/Level Completed"

func _ready():
	RenderingServer.set_default_clear_color(Color.BLACK)
	polygon_2D.polygon = collision_polygon_2d.polygon
	Events.level_completed.connect(show_level_completed)
	
func show_level_completed():
	level_completed.show()
