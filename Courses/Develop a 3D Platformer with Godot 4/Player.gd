extends CharacterBody3D

var move_speed : float = 4.0
var jump_force : float = 8.0
var gravity : float = 20.0

var facing_angle : float

var score : int

@onready var model : MeshInstance3D = get_node("Model")
@onready var score_text : Label = get_node("ScoreText")

func _physics_process(delta):
  
  # Apply gravity
  if not is_on_floor():
    velocity.y -= gravity * delta
  
  # Apply Jump Velocity if jump key is pressed and on the floor
  if Input.is_action_pressed("jump") and is_on_floor():
    velocity.y = jump_force
  
  # Get keyboard input
  var input = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
  
  # Convert to vector3
  var dir = Vector3(input.x, 0, input.y)
  
  # Assign x/z velocity
  velocity.x = dir.x * move_speed
  velocity.z = dir.z * move_speed
  
  # apply velocity to characterbody3d
  move_and_slide()
  
  # if input is being added, change facing angle of player
  if input.length() > 0:
    facing_angle = Vector2(input.y, input.x).angle()
  
  # Apply facing_angle to model's rotation
  model.rotation.y = lerp_angle(model.rotation.y, facing_angle, 0.125)
  
  if global_position.y < -5:
    game_over()

func game_over():
  get_tree().reload_current_scene()

func add_score(amount):
  score += amount
  score_text.text = str("Score: ", score)
