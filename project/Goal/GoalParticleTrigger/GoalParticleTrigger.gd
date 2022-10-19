extends Area2D


onready var _particles := find_node("VictoryParticles")


func _on_GoalParticleTrigger_area_entered(_area) -> void:
	_particles.emitting = true
