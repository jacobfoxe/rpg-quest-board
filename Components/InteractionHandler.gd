class_name InteractionComponent extends Node

var parent_node : Node3D

func _ready() -> void:
	parent_node = get_parent()
	setup_parent()
	
func _on_interacted() -> void:
	pass

## Set up parent's interaction functionality
func setup_parent() -> void:
	parent_node.add_user_signal("interacted")
	parent_node.connect("interacted", Callable(self, "_on_interacted"))
	parent_node.connect("interacted", Callable(parent_node, "_on_interacted"))
	parent_node.set_collision_layer_value(1, true)
	parent_node.connect("interacted", Callable(get_tree().current_scene, "_on_interaction_occured"))
