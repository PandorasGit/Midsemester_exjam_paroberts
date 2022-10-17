extends Area2D


signal killed


var _is_alive := true


onready var _tween := find_node("Tween")
onready var _death_timer := find_node("DeathTimer")
onready var _sprite := find_node("Sprite")
onready var _death_particles := find_node("DeathParticles")


func _input(event) -> void:
	if event is InputEventMouseButton and _is_alive:
		_move()


func _move() -> void:
	var _new_position =  get_global_mouse_position()
	look_at(_new_position)
	_tween.interpolate_property(self, "position",
		position, _new_position, 1,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	_tween.start()


func _on_Airplane_body_entered(body) -> void:
	if body.is_in_group("spikes"):
		_die()


func _die() -> void:
	_tween.stop_all()
	_tween.remove_all()
	_death_particles.emitting = true
	_is_alive = false
	_tween.interpolate_property(_sprite, "scale",
		Vector2(1,1), Vector2.ZERO, 0.1,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	_tween.start()
	_death_timer.start()


func _on_DeathTimer_timeout():
	emit_signal("killed")

