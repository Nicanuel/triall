extends Area2D

@export var timer: Timer
@onready var player =  $player


func _on_body_entered(_body: Node2D) -> void:
	print("Died")
	get_tree().reload_current_scene()
