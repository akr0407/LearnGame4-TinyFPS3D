extends StaticBody3D

@export var door: Node

var is_active = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func interact() -> void:
	#print("switch interacted")
	is_active = not is_active
	print("Switch status: ", is_active)
	
	if is_active:
		$MeshInstance3D.material_override.albedo_color = Color.FOREST_GREEN
	else:
		$MeshInstance3D.material_override.albedo_color = Color.CRIMSON
		
	door.toggle_door()
	
