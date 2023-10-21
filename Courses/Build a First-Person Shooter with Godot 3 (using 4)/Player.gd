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
var vel : Vector3 = Vector3()
var mouseDelta : Vector2 = Vector2()

@onready var camera : Camera3D = $Camera3D
@onready var muzzle : Node3D = $Camera3D/Muzzle

func _physics_process(delta):
  pass
