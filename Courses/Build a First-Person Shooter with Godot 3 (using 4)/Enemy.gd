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

func _on_timer_timeout():
  if position.distance_to(player.position) <= attackDist:
    attack()
    
func attack():
  player.take_damage(damage)
