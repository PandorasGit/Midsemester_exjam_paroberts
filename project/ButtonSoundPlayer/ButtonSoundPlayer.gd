extends Timer


onready var _sfx := find_node("Sfx")


func play_sound() -> void:
	_sfx.play()
	start()
