extends StaticBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _on_area_of_activating_body_entered(body: Node2D) -> void:
	if body.name == "player":
		print("Touched")
		if Input.is_action_just_pressed("atk"):
			animated_sprite_2d.play("Break");
