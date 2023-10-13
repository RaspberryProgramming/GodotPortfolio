extends CharacterBody3D

var move_speed : float = 4.0
var jump_force : float = 8.0
var gravity : float = 20.0

var facing_angle : float

@onready var model : MeshInstance3D = get_node("Model")

func _physics_process(delta):
  
  # Apply gravity
  if not is_on_floor():
    velocity.y -= gravity * delta
    
  var input = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
  var dir = Vector3(input.x, 0, input.y)
  
  velocity.x = dir.x * move_speed
  velocity.z = dir.z * move_speed
  
  move_and_slide()
  
  if input.length() > 0:
    facing_angle = Vector2(input.y, input.x).angle()
  
  model.rotation.y = lerp_angle(model.rotation.y, facing_angle, 0.125)
