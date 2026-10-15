extends Node3D

@onready var camera_3d: Camera3D = %Camera3D

@export var ground_scene: PackedScene

func _ready() -> void:
	var first_ground = ground_scene.instantiate()
	first_ground.position.z = 75
	add_child(first_ground)
	
	var second_ground = ground_scene.instantiate()
	second_ground.position.z = 225
	add_child(second_ground)
	
func _on_spawn_new_ground_area_3d_body_entered(body: Node3D) -> void:
	var new_ground = ground_scene.instantiate()
	new_ground.position.z = 375
	add_child(new_ground)
	
func _on_delete_ground_area_3d_body_entered(body: Node3D) -> void:
	body.queue_free()
