## Cursor module.
class_name Cursor extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(false)
	self.visible = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# Update the position of the cursor to match the mouse position. 
	global_position = get_global_mouse_position()
	

## Activates the cursor and makes it visible on the screen. 
func activateCursor() -> void: 
	position = get_global_mouse_position()
	self.visible = true
	set_process(true)

## Deactivates the cursor and makes it invisible. 
func deactivateCursor() -> void: 
	self.visible = false
	set_process(false)
