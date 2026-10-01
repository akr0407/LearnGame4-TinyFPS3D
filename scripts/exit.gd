extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	#print(body)
	if body.is_in_group("player"):
		#print("Player entered exit area")
		get_parent().game_completed = true
		#print("Game completed: ", get_parent().game_completed)
