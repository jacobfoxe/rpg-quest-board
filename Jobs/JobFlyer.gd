@tool
class_name JOB_FLYER extends StaticBody3D

@export var selected_flag : bool = false : 
	set(value): 
		$MeshInstance3D/glow.visible = value
		selected_flag = value

@export var job : JOB	## Job resource to link to this static body

@onready var label : Label3D = $Label3D

func _process(_delta):
	## If we're editing, update the size based on the text box ##
	if Engine.is_editor_hint():
		$MeshInstance3D.mesh.size.y = $Label3D.get_aabb().size.y / 2.0
		

#/
## Call to set up a new job on this flyer.
func set_Job(newJob : JOB):
	self.job = newJob
	label.set_text(newJob.message)
	await get_tree().process_frame
	updateFlyerSize()

#/
## Update the flyer size based on the text length. 
func updateFlyerSize():
	## Check for valid job ##
	if job == null:
		print("Job is null; cannot update size")
		return
		
	$MeshInstance3D.mesh.size.y = $Label3D.get_aabb().size.y / 2.0
	print("\nUpdating size for " + job.title + "!")
	print("Label size.y: " + str($Label3D.get_aabb().size.y))
	print("Mesh size.y: " + str($MeshInstance3D.mesh.size.y))
