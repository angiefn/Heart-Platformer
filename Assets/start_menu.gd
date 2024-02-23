extends CenterContainer

@onready var start_game_button = $VBoxContainer/StartGameButton

func _ready():
	start_game_button.grab_focus()

func _on_quit_button_pressed():
	get_tree().quit()

func _on_start_game_button_pressed():
	await LevelTransition.fade_to_black()
	get_tree().change_scene_to_file("res://level_one.tscn")
	LevelTransition.fade_from_black()
