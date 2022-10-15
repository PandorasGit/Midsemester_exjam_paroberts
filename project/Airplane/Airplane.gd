extends KinematicBody2D


onready var _viewport := get_viewport()
onready var _movement_tween := find_node("MovementTween")



func _input(event):
	if event is InputEventMouseMotion:
		_move()


func _move() -> void:
	var new_position = _viewport.get_mouse_position()
	look_at(new_position)
	_movement_tween.interpolate_property(self, "position",
		position, new_position, 1,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	_movement_tween.start()

