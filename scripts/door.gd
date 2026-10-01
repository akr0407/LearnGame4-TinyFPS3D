extends StaticBody3D

@export var door_speed = 180.0

var is_open = false
var target_rotation = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var current = get_parent().rotation_degrees.y
	
	get_parent().rotation_degrees.y = move_toward(
		current,
		target_rotation,
		door_speed * delta
	)

func interact() -> void:
	toggle_door()

func toggle_door() -> void:
	is_open = not is_open
	print("Door open: ", is_open)
	
	if is_open == true:
		target_rotation = 90
	else:
		target_rotation = 0
	
	print("Door rotation Y: ", target_rotation)
