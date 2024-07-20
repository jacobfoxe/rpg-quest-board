class_name InteractionComponent extends Node

var parent_node : Node3D

func _ready() -> void:
	parent_node = get_parent()
	setup_parent()
	
func _on_interacted() -> void:
	print(parent_node.name)

func setup_parent() -> void:
	parent_node.add_signal("interacted")
	parent_node.connect("interacted", Callable(self, "_on_interacted"))
	parent_node.set_collision_layer_value(1, true)
