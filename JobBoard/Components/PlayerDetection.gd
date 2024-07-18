## This scene allows for component-level reception of player calls. 
class_name PLAYER_DETECTION extends Area3D

signal interacted_with(player)

func interact(player : PLAYER):
	emit_signal("interacted_with",player)
