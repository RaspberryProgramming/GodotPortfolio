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
@onready var bulletScene = load('res://Bullet.tscn')

func _ready():
  # hide and lock the mouse cursor
  Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

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
  
func _process(delta):
  # rotate the camera along the x axis
  camera.rotation_degrees.x -= mouseDelta.y * lookSensitivity * delta
  
  # clamp camera x rotation axis
  camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, minLookAngle, maxLookAngle)
  
  # rotate the player along their y axis
  rotation_degrees.y -= mouseDelta.x * lookSensitivity * delta
  
  # reset the mouse delta vector
  mouseDelta = Vector2()
  
  # check to see if we have shot
  if Input.is_action_just_pressed("shoot") and ammo > 0:
    shoot()
  
func _input(event):
  if event is InputEventMouseMotion:
    mouseDelta = event.relative

func shoot():
  var bullet = bulletScene.instantiate()
  get_node("/root/MainScene").add_child(bullet)
  
  bullet.global_transform = muzzle.global_transform
  
  ammo -= 1
  
