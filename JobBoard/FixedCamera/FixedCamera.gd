## Handle a fixed camera for a 3D object. 
class_name FixedCamera extends Node3D

var parent_node : Node3D
@onready var camera_3d: Camera3D = $Camera3D

func _ready() -> void:
	parent_node = get_parent()
	setup_parent()
	
func _on_interacted() -> void:
	camera_3d.current = true

## Set up parent's functionality
func setup_parent() -> void:
	parent_node.connect("interacted", Callable(self, "_on_interacted"))
