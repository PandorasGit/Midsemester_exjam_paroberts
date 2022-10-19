extends Timer


onready var _sfx := find_node("Sfx")


func play_sound():
	_sfx.play()
	start()
