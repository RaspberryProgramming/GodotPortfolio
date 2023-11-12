extends CharacterBody3D

var curHp : int = 3;
var maxHp : int = 3;

var damage : int = 1;
var attackDist : float = 1.5;
var attackRate : float = 1.0;

var moveSpeed : float = 2.5;

@onready var timer = get_node("Timer");
@onready var player = get_node("/root/MainScene/Player");

func _ready():
  # set timer wait time and start
  timer.wait_time = attackRate;
  timer.start();

func _on_timer_timeout():
  if position.distance_to(player.position) <= attackDist:
    player.take_damage(damage);

# Called when player deals damage
func take_damage(damageToTake):
  
  curHp -= damageToTake;
  
  # if our health reaches 0 - die
  if curHp <= 0:
    die();
    
# Called when health reaches 0
func die():
  queue_free();
