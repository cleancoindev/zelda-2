extends Node2D

@onready var camera : GridCamera = $Camera


func _ready() -> void:
	camera.scroll_started.connect(_on_camera_scroll_started)
	camera.scroll_completed.connect(_on_camera_scroll_completed)


func _on_camera_scroll_started() -> void:
	for entity in get_tree().get_nodes_in_group("entity"):
		entity.set_physics_process(false)
		entity.sprite.stop()


func _on_camera_scroll_completed() -> void:
	for entity in get_tree().get_nodes_in_group("entity"):
		if camera.world_to_grid(entity.position) == camera.grid_position:
			entity.set_physics_process(true)
