#/
## This is a basic Player class that handles movement, camera control, and interactivity with world objects. 
class_name PLAYER extends CharacterBody3D

signal interact	## Emitted when the player interacts. Handled by world objects. 

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var marker_3d = $Marker3D

@export var jobList : JOB_LIST	## JOB_LIST Resource to contain all jobs the player has taken. 

@export_group("Sensitivity")
@export_range(0.0,1.0,0.1) var horizontalSensitivity : float = 0.5	## Horizontal Mouse Sensitivity
@export_range(0.0,1.0,0.1) var verticalSensitivity : float = 0.5	## Vertical Mouse Sensitivity



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	## Capture the mouse in-window
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _input(event):
	## Rotate Camera for Mouse Movement
	if (event is InputEventMouseMotion) and (Input.mouse_mode == Input.MOUSE_MODE_CAPTURED):
		rotate_y(deg_to_rad(-event.relative.x * horizontalSensitivity))
		marker_3d.rotate_x(deg_to_rad(-event.relative.y * verticalSensitivity))
		
	## Handle un-focus of mouse
	if event is InputEventKey and event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	## Handle interact button
	if Input.is_action_just_pressed("interact"):
		emit_signal("interact")
		
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
