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
func get_random_job(repeats_allowed : bool) -> JOB:
	var rng : RandomNumberGenerator = RandomNumberGenerator.new()
	rng.randomize()
	var foundJob : JOB = jobs[rng.randi()%(jobs.size())]
	
	## Check if the foundJob has been used already on a board ##
	if foundJob.used == false:
		## Not used; set it to used and return it ##
		foundJob.used = true
	else:
		## Used already ##
		if repeats_allowed == true:
			## Repeats are allowed, so return the job ##
			pass
		else:
			## Repeats are not allowed, so loop through random jobs until you find unused ones ##
			while foundJob.used == true:
				foundJob = jobs[rng.randi()%(jobs.size())]
			foundJob.used = true
			
	return foundJob
