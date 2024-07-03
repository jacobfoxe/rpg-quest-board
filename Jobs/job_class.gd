class_name JOB extends Resource

@export var title : String					## Arbitrary identifier.
@export_multiline var message : String		## Contents of the request

@export_group("Handling")
@export var picked_up_flag : bool = false	## TRUE if picked up by the player
@export var used : bool = false				## TRUE if placed on the board at least once
