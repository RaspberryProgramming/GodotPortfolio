extends CharacterBody2D

var curHp : int = 10;
var maxHp : int = 10;
var moveSpeed : int = 250;
var damage : int = 1;

var gold : int = 0;

var curLevel : int = 0;
var curXp : int = 0;
var xpToNextLevel : int = 50;
var xpToNextLevelIncreaseRate : float = 1.2;

var interactDist : int = 70;

var vel : Vector2 = Vector2();
var facingDir : Vector2 = Vector2();

@onready var rayCast = get_node("RayCast2D");

func _physics_process(delta):
  vel = Vector2();
  
  # inputs
  if Input.is_action_pressed("move_up"):
    vel.y -= 1;
    facingDir = Vector2(0, -1);
  if Input.is_action_pressed("move_down"):
    vel.y += 1;
    facingDir = Vector2(0, 1);
  if Input.is_action_pressed("move_left"):
    vel.x -=1;
    facingDir = Vector2(-1, 0);
  if Input.is_action_pressed("move_right"):
    vel.x +=1;
    facingDir = Vector2(1, 0);
