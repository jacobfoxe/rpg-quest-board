extends StaticBody3D

signal open_board(job_list)

const flyerNode = preload("res://Jobs/JobFlyer.tscn")
@onready var pins : Array[Marker3D] = [$Pins/Pin0, $Pins/Pin1, $Pins/Pin2, $Pins/Pin3]

var jobs : Array[JOB] = []	## List of jobs on this board. 

func _ready():
	populate_job_board()

#/
## Fill out the Job Board with flyers.
func populate_job_board():
	## Loop through pins and create a flyer for each. 
	for pin in pins:
		create_job_flyer(JOB_MANAGER.get_random_job(false), pin)

#/
## Instantiate a new flyer and populate it with a job. 
func create_job_flyer(job : JOB, pin : Marker3D):
	var newFlyer : JOB_FLYER = flyerNode.instantiate()
	pin.add_child(newFlyer)
	newFlyer.set_Job(job)
	jobs.push_back(job)
	print("Job Created: " + job.title + " on pin: " + pin.name)

#/
## Connected to activePlayer signal for interaction. 
func _on_player_interact(body : PLAYER):
	emit_signal("open_board", jobs)
	print(str(body) + " interacted with me!")


func _on_player_detection_interacted_with(player : PLAYER):
	print("This Player interacted with me: " + player.playerName)
	## TODO: change camera and change controls to select jobs
