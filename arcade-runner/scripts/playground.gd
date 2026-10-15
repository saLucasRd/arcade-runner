extends Node3D

@onready var camera_3d: Camera3D = %Camera3D
@onready var camera_3d_2: Camera3D = %Camera3D2

@export var ground_scene: PackedScene
@export var obstacles: Array[PackedScene]
@export var x_position_possible_values: Array[float]

@export var debug_mode: bool = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("switch_camera"):
		if not camera_3d.current:
			camera_3d.make_current()
		else:
			camera_3d_2.make_current()

func _process(delta: float) -> void:
	render_debug()

func _ready() -> void:
	var first_ground = ground_scene.instantiate()
	first_ground.position.z = 75
	add_child(first_ground)
	
	var second_ground = ground_scene.instantiate()
	second_ground.position.z = 225
	add_child(second_ground)

## instantiating a new ground scene with a random obstacle from the array
func _on_spawn_new_ground_area_3d_body_entered(body: Node3D) -> void:
	var new_ground = ground_scene.instantiate()
	new_ground.position.z = 375
	var new_obstacle = obstacles.pick_random().instantiate()
	new_obstacle.position.y = 6
	new_obstacle.position.x = x_position_possible_values.pick_random()
	new_ground.add_child(new_obstacle)
	
	add_child(new_ground)
	
func _on_delete_ground_area_3d_body_entered(body: Node3D) -> void:
	body.queue_free()
	

#region Debug
#deixando isso aqui porque pode ser util
func render_debug():
	if not debug_mode: return
	ImGui.Begin(name)
	if ImGui.Button("example"):
		print("exemaple")
		
	ImGui.End()

#endregion
