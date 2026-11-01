extends Node2D

var speed = 200
var despawn_ready: = true

func timer():
	$"../Timer".start()
	despawn_ready = false
	
func _on_timer_timeout() -> void:
	queue_free()
	despawn_ready   = true
	print("Despawned")
	
func _physics_process(delta): 
	global_position.x -= speed * delta
	if despawn_ready == true:
		timer()
