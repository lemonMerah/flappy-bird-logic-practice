extends CharacterBody2D

const flap = 400
const gravity = 800
const max_gravity = 1300
var current_gravity = gravity

func flying():
	if Input.is_action_just_pressed("jump"):
		velocity.y -= flap 

func _physics_process(delta):
	velocity.y += gravity * delta
	
	if current_gravity < max_gravity:
		current_gravity += 10 * delta
	
	move_and_slide()
	
	flying()
	
		

		
