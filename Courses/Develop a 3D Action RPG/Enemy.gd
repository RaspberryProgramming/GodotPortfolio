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

func _physics_process(delta):
  # distance to player
  var dist : float = position.distance_to(player.position);
  
  # chase after the player, if we're outside of the attack distance
  if dist > attackDist:
    # direction between us and the player
    var dir : Vector3 = (player.position - position).normalized();
    
    velocity.x = dir.x * moveSpeed;
    velocity.y = 0;
    velocity.z = dir.z * moveSpeed;
    
    move_and_slide();
    

# Called when player deals damage
func take_damage(damageToTake):
  
  curHp -= damageToTake;
  
  # if our health reaches 0 - die
  if curHp <= 0:
    die();
    
# Called when health reaches 0
func die():
  queue_free();
