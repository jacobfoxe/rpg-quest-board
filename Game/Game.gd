extends Node

@onready var platform: StaticBody3D = $Platform
@onready var cursor: Cursor = $Cursor
@onready var player: Player = $Player


func _on_interaction_occured() -> void:
	cursor.activateCursor()

func _on_board_released() -> void: 
	player.assume_controls()
	cursor.deactivateCursor()
