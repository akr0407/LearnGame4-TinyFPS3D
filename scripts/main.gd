extends Node3D

var game_completed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if game_completed:
		$UI/Crosshair.visible = false
		$UI/VictoryLabel.visible = true
		$UI/RestartButton.visible = true


func _on_restart_button_pressed() -> void:
	#print("restart button pressed")
	get_tree().reload_current_scene()
