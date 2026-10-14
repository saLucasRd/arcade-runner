class_name Ground
extends StaticBody3D

@export var speed: float

func _physics_process(delta: float) -> void:
	position.z -= speed * delta
