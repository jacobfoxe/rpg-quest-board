class_name JOB_FLYER extends StaticBody3D

@export var selected_flag : bool = false : 
	set(value): 
		$MeshInstance3D/glow.visible = value

@export var job : JOB	## Job resource to link to this static body

@onready var label : Label3D = $Label3D

#/
## Call to set up a new job on this flyer.
func set_Job(newJob : JOB):
	self.job = newJob
	label.set_text(newJob.message)
	$MeshInstance3D.mesh.size = label.get_aabb().size
	$MeshInstance3D.transform = label.transform
	$MeshInstance3D.position.z += $MeshInstance3D.mesh.size.z

