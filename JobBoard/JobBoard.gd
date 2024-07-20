class_name JobBoard extends StaticBody3D

signal board_focus_closed
signal open_board(job_list)

const flyerNode = preload("res://Jobs/JobFlyer.tscn")
@onready var pins : Array[Node] = $Pins.get_children()
@onready var cancel_area: Area3D = $Area3D

var jobs : Array[JOB] = []	## List of jobs on this board. 

func _ready():
	populate_job_board()
	cancel_area.visible = false
	cancel_area.monitoring = false

## Fill out the Job Board with flyers.
func populate_job_board():
	## Loop through pins and create a flyer for each. 
	for pin in pins:
		create_job_flyer(JOB_MANAGER.get_random_job(false), pin)

## Instantiate a new flyer and populate it with a job. 
func create_job_flyer(job : JOB, pin : Marker3D):
	var newFlyer : JOB_FLYER = flyerNode.instantiate()
	pin.add_child(newFlyer)
	newFlyer.set_Job(job)
	jobs.push_back(job)
	print("Job Created: " + job.title + " on pin: " + pin.name)

func _on_interacted():
	cancel_area.visible = true
	cancel_area.monitoring = true

## Called when the cancel button is pressed. 
func _on_cancel_tex_input_event(camera: Node, event: InputEvent, position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		print("Cancel Pressed")
		emit_signal("board_focus_closed")
		cancel_area.visible = false
		cancel_area.monitoring = false
