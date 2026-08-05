extends CharacterBody2D
@onready var play_anim = $AnimatedSprite2D
var speed = 300
var force = 400
var poids = 900
var hp = 3
var is_onground = true
var jump = 0
@onready var txt_jump = $jump
var global




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	txt_jump.text = str(jump)
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	txt_jump.text = str(jump)
	
	if not is_on_floor():
		velocity.y += poids * delta
	else:
		velocity.y = 0
	
	velocity.x = 0
	
	if hp > 0:
		if Input.is_action_pressed("av"):
			velocity.x = speed
			play_anim.play("dash")
			play_anim.flip_h = false
		if Input.is_action_pressed("rec"):
			velocity.x = -speed
			play_anim.play("dash")
			play_anim.flip_h = true
		if  Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y -= force
			play_anim.play("jump")
			jump += 1
		elif Input.is_action_just_pressed("atk"):
			play_anim.play("atk")
			
			
		if velocity.x == 0:
			play_anim.play("idle")
			
			
		
	move_and_slide()
	
	
	
	pass
