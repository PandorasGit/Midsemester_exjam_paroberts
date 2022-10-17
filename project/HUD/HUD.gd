extends CanvasLayer


signal restart


var player setget _set_player


onready var _restart_button := find_node("RestartButton")
onready var _win_text := find_node("WinText")


func _set_player(value: Area2D) -> void:
	player = value
	player.connect("killed", self, "_on_player_killed")
	player.connect("won", self, "_on_player_won")


func _on_player_killed() -> void:
	_restart_button.visible = true


func _on_RestartButton_pressed():
	emit_signal("restart")


func _on_player_won() -> void:
	_win_text.visible = true
	_restart_button.visible = true
