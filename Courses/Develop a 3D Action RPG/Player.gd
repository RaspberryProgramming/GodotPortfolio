extends CharacterBody3D

var curHp : int = 10;
var maxHp : int = 10;
var damage : int = 1;

var gold : int = 0;

var attackRate : float = 0.3;
var lastAttackTime : int = 0;

var moveSpeed : float = 5.0;
var jumpForce : float = 10.0;
var gravity : float = 15.0;

@onready var camera = get_node("CameraOrbit");
@onready var attackRayCast = get_node("AttackRayCast");

func _physics_process(delta):
  
  velocity.x = 0;
  velocity.z = 0;
  
  var input = Vector3();
  
  if Input.is_action_pressed("move_forward"):
    input.z += 1;
  if Input.is_action_pressed("move_backward"):
    input.z -= 1;
  if Input.is_action_pressed("move_left"):
    input.x += 1;
  if Input.is_action_pressed("move_right"):
    input.x -= 1;
  
  input = input.normalized(); # Normalize input vector

  var dir : Vector3 = (transform.basis.z * input.z + transform.basis.x * input.x);
  
  velocity.x = dir.x * moveSpeed;
  velocity.z = dir.z * moveSpeed;
  
  