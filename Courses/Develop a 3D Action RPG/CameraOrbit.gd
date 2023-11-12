extends Node3D

var lookSensitivity : float = 15.0;
var minLookAngle : float = -20.0;
var maxLookAngle : float = 75.0;

var mouseDelta : Vector2 = Vector2();

@onready var player = get_parent();

func _ready():
  Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);

func _input(event):
  if event is InputEventMouseMotion:
    mouseDelta = event.relative;
    
func _process(delta):
  # Calculate rotation from mouse event
  var rotation : Vector3 = Vector3(mouseDelta.y, mouseDelta.x, 0) * lookSensitivity * delta;

  rotation_degrees.x += rotation.x;
  
  rotation_degrees.x = clamp(rotation_degrees.x, minLookAngle, maxLookAngle);
  
  player.rotation_degrees.y -= rotation.y;
  
  mouseDelta = Vector2(); # Reset mouseDelta
