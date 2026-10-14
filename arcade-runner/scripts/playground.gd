extends Node3D

@export var ground_scene: PackedScene



func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	pass

func _on_spawn_new_ground_area_3d_body_entered(body: Node3D) -> void:
	var new_ground = ground_scene.instantiate()
	new_ground.position.z = 100
	add_child(new_ground)
	var new_ground2 = ground_scene.instantiate()
	new_ground.position.z = 150
	add_child(new_ground)
