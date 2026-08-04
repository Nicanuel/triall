extends Area2D

@export var timer: Timer

func _on_body_entered(body: Node2D) -> void:
	print("Died")
	get_tree().reload_current_scene()
