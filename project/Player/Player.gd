extends Area2D


signal killed
signal won


var _is_alive := true


onready var _death_timer := find_node("DeathTimer")
onready var _sprite := find_node("Sprite")
onready var _death_particles := find_node("DeathParticles")


func _input(event) -> void:
	if event is InputEventMouseButton and _is_alive:
		_move()


func _move() -> void:
	var _new_position =  get_global_mouse_position()
	var _tween := create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN_OUT)
	# warning-ignore:return_value_discarded
	_tween.tween_property(self, "global_position", _new_position, 1.0)
	var target_rotation := global_position.direction_to(_new_position).angle()
	# warning-ignore:return_value_discarded
	_tween.parallel().tween_property(self, "rotation", target_rotation, 0.1)


func _on_Airplane_body_entered(body) -> void:
	if body.is_in_group("spikes"):
		_die()
	elif body.is_in_group("goal"):
		_win()


func _die() -> void:
	var _death_position := position
	var _tween := create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	# warning-ignore:return_value_discarded
	_tween.tween_property(self, "global_position", _death_position, 1)
	# warning-ignore:return_value_discarded
	_tween.parallel().tween_property(_sprite, "scale", Vector2.ZERO, 0.5)
	_death_particles.emitting = true
	_is_alive = false
	_death_timer.start()


func _on_DeathTimer_timeout() -> void:
	emit_signal("killed")


func _win() -> void:
	_is_alive = false
	emit_signal("won")
