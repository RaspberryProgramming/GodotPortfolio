extends CharacterBody3D

# stats
var health : int = 5
var moveSpeed : float = 2.0

# attacking
var damage : int = 1
var attackRate : float = 1.0
var attackDist : float = 2.0

var scoreToGive : int = 10

# components
@onready var player : Node = get_node("/root/MainScene/Player")

@onready var timer : Timer = get_node("Timer")

func _ready():
  
  # setup the timer
  timer.set_wait_time(attackRate)
  timer.start()
  
func _physics_process(delta):  
  
  if position.distance_to(player.position) > attackDist:
    
    # calculate the direction to the player
    var dir = (player.position - position).normalized()
    dir.y = 0
    
    # move enemy towards the player
    velocity = dir*moveSpeed
    move_and_slide()

func take_damage(damage):

  health -= damage
  
  if health <= 0:
    die()
  
func die():
  player.add_score(scoreToGive)
  
  queue_free()
  
func attack():
  player.take_damage(damage)

func _on_timer_timeout():
  if position.distance_to(player.position) <= attackDist:
    attack()
