extends Node2D

@export var next_level: PackedScene

@onready var level_completed = $"CanvasLayer/Level Completed"

func _ready():
	RenderingServer.set_default_clear_color(Color.BLACK)
	Events.level_completed.connect(show_level_completed)
	
func show_level_completed():
	level_completed.show()
	if not next_level is PackedScene: return
	get_tree().paused = true
	await get_tree().create_timer(1.0).timeout
	await LevelTransition.fade_to_black()
	get_tree().paused = false
	get_tree().change_scene_to_packed(next_level)
	LevelTransition.fade_from_black()
