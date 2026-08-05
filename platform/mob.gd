extends CharacterBody2D

var speed = 60
var chase = false
var target = null
@onready var anim = $AnimatedSprite2D
var grav = 900

func _physics_process(_delta: float) -> void:
	if not is_on_floor():
		velocity.y += grav * _delta
	else:
		velocity.y = 0
	
	
	if chase and target != null:
		anim.play("detection")
		var direction = (target.global_position - global_position).normalized()
		velocity.x = direction.x * speed
		anim.play("move")
		anim.flip_h = direction.x < 0
		if direction.x != 0:
			anim.flip_h = direction.x > 0
	else:
		velocity.x = 0
		anim.play("idle")
	
	move_and_slide()


func _on_detection_body_entered(body: Node2D) -> void:
	if body.name == "player":
		target = body
		chase = true
	pass # Replace with function body.


func _on_detection_body_exited(body: Node2D) -> void:
	target = null
	chase = false
	pass # Replace with function body.
