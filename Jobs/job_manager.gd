extends Node

const DEBUG = false

const JOB_PATH : String = "res://Jobs/All Jobs/"	## Location of all of the job resources.

var jobs : Array[JOB] = []	## Local copy of all loaded resources.

func _ready():
	get_all_jobs()
	
	if DEBUG:
		print("All Jobs: " + str(jobs))

#/
## Grab all of the jobs in the JOB_PATH folder. 
func get_all_jobs():
	## Loop through JOB_PATH and load all job resources ##
	for file in DirAccess.get_files_at(JOB_PATH):
		jobs.push_back(load(JOB_PATH + file))
		
		if DEBUG:
			print("Loaded File: " + str(file))

#/
## Returns a random job resource from the list of jobs. 
func get_random_job() -> JOB:
	var rng : RandomNumberGenerator = RandomNumberGenerator.new()
	rng.randomize()
	return jobs[rng.randi()%(jobs.size())]
