extends CanvasLayer


signal restart


var player setget _set_player


onready var _restart_button := find_node("RestartButton")
onready var _win_text := find_node("WinText")
onready var _button_sound_player := find_node("ButtonSoundPlayer")


func _set_player(value: Area2D) -> void:
	player = value
	player.connect("killed", self, "_on_player_killed")
	player.connect("won", self, "_on_player_won")


func _on_player_killed() -> void:
	_restart_button.visible = true


func _on_player_won() -> void:
	_win_text.visible = true
	_restart_button.visible = true


func _on_RestartButton_pressed():
	_button_sound_player.play_sound()


func _on_ButtonSoundPlayer_timeout():
	emit_signal("restart")
