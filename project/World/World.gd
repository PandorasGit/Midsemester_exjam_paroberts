extends Node2D


onready var _menu := load("res://MainMenu/MainMenu.tscn")
onready var _player := find_node("Player")
onready var _hud := find_node("HUD")


func _ready() -> void:
	_hud.player = _player
	# warning-ignore:return_value_discarded
	_hud.connect("restart", self, "_on_restart")


func _on_restart() -> void:
	# warning-ignore:return_value_discarded
	get_tree().change_scene_to(_menu)
