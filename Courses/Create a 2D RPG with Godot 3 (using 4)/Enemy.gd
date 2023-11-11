extends CharacterBody2D

var curHp : int = 5;
var maxHp : int = 5;

var moveSpeed : int = 150;
@export var xpToGive : int = 30;

var damage : int = 1;
var attackRate : float = 1.0;
var attackDist : int = 80;
var chaseDist : int = 400;

@onready var timer = get_node("Timer");
@onready var target = get_node("/root/MainScene/Player");

func _ready():
  timer.wait_time = attackRate;
  timer.start();

func _physics_process(delta):
  
  # Get our distance from player
  var dist = position.distance_to(target.position);
  
  velocity = Vector2(0,0);
  
  if dist > attackDist and dist < chaseDist:
    velocity = (target.position - position).normalized() * moveSpeed;
    
  move_and_slide();

func _on_timer_timeout():
  if position.distance_to(target.position) <= attackDist:
    target.take_damage(damage);

func take_damage(dmgToTake):
  curHp -= dmgToTake;
  
  if curHp <= 0:
    die();
    
func die():
  
  target.give_xp(xpToGive); # Give player xp
  queue_free(); # Destroy enemy node
