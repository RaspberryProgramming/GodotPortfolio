extends CharacterBody3D

# stats
@export var maxHp : int = 10
var curHp : int = 10
var ammo : int = 15
var score : int = 0

# physics
var moveSpeed : float = 5.0
var jumpForce : float = 5.0
@export var gravity : float = 12.0

# cam look
@export var minLookAngle : float = -90.0
@export var maxLookAngle : float = 90.0
@export var lookSensitivity : float = 10.0

# vectors
#var vel : Vector3 = Vector3()
var mouseDelta : Vector2 = Vector2()

@onready var camera : Camera3D = $Camera3D
@onready var muzzle : Node3D = $Camera3D/Muzzle

func _physics_process(delta):
  # reset the x and z velocity
  
  var input = Vector2()
  
  # movement inputs
  if Input.is_action_pressed("move_forward"):
    input.y -= 1
  
  if Input.is_action_pressed("move_backward"):
    input.y += 1
    
  if Input.is_action_pressed("move_left"):
    input.x -= 1
  
  if Input.is_action_pressed("move_right"):
    input.x += 1
    
  input = input.normalized()
  
  # get the forward and right directions
  var forward = global_transform.basis.z
  var right = global_transform.basis.x
  
  var relativeDir = (forward * input.y + right * input.x)
  
  # set the velocity
  velocity.x = relativeDir.x * moveSpeed
  velocity.z = relativeDir.z * moveSpeed
  
  # apply gravity
  if not is_on_floor():
    velocity.y -= gravity * delta
  
  # jumping
  if Input.is_action_pressed("jump") and is_on_floor():
    velocity.y = jumpForce
    
  move_and_slide()
  
