extends CharacterBody3D


const SPEED = 5.0
const GRAVITY = 9.8

@export var MOUSE_SENSITIVITY = 0.002
@export var head_bob_enabled = true
@export var head_bob_speed = 10
@export var head_bob_return_speed = 10.0
@export var head_bob_amount = 0.05

var pitch = 0.0
var head_bob_time = 0.0
var camera_base_y = 0.0

func _ready() -> void:
	camera_base_y = $CameraPivot.position.y
	
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float) -> void:
	var direction = Vector3.ZERO
	
	if not is_on_floor():
		velocity.y -= GRAVITY * delta
	else:	
		velocity.y = 0
		
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
	if Input.is_action_pressed("move_backward"):
		direction.z += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	
	direction = direction.normalized()
	
	if head_bob_enabled and direction != Vector3.ZERO:
		head_bob_time += delta	
		
		var bob_offset = sin(head_bob_time * head_bob_speed) * head_bob_amount
		
		$CameraPivot.position.y = camera_base_y + bob_offset
	else:
		$CameraPivot.position.y = lerp(
			$CameraPivot.position.y,
			camera_base_y,
			head_bob_return_speed * delta
		)
	
	
	direction = transform.basis * direction
	
	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED
	
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		#print(event.relative)
		
		rotation.y -= event.relative.x * MOUSE_SENSITIVITY
		
		pitch -= event.relative.y * MOUSE_SENSITIVITY
		
		pitch = clamp(pitch, deg_to_rad(-80), deg_to_rad(80))
		
		$CameraPivot.rotation.x = pitch
	
	if Input.is_action_just_pressed("esc"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
