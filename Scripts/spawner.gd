extends Node2D

var pipes_scene : PackedScene = preload("res://Scenes/pipes.tscn")
@onready var marker: Marker2D = $"."

var spawn_ready: = true  

func spawner():
	var spawn = pipes_scene.instantiate()
	#spawn.global_position = marker.position + Vector2(0, pipe_height)
	spawn.global_position = Vector2(
		marker.position.x,
		marker.position.y + randf_range(-420, -10)
	)
	add_child(spawn)
	
func timer():
	$Timer.start()
	spawn_ready = false

func _on_timer_timeout() -> void:
	spawn_ready = true
	
	
func _physics_process(delta: float) -> void:
	if spawn_ready == true:
		spawner()
		timer()
		
