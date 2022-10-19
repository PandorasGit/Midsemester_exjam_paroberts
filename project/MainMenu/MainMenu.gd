extends Control


onready var _world := preload("res://World/World.tscn")
onready var _sfx_timer := find_node("ButtonSoundPlayer")


func _on_StartButton_pressed() -> void:
	_sfx_timer.play_sound()




func _on_ButtonSoundPlayer_timeout() -> void:
	# warning-ignore:return_value_discarded
	get_tree().change_scene_to(_world)
