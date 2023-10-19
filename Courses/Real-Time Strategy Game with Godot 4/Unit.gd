extends CharacterBody2D

@export var health : int = 100
@export var damage : int = 20

@export var move_speed : float = 50.0
@export var attack_range : float = 20.0
@export var attack_rate : float = 0.5

var last_attack_time : float

var target : CharacterBody2D
var agent : NavigationAgent2D
var sprite : Sprite2D

@export var is_player : bool

func _ready():
  agent = $NavigationAgent2D
  sprite = $Sprite2D

func move_to_location(location):
  target = null
  agent.target_position = location

func set_target(new_target):
  target = new_target

func _try_attack_target():
  var cur_time = Time.get_unix_time_from_system()
  
  if cur_time - last_attack_time > attack_rate:
    target.take_damage(damage)
    last_attack_time = cur_time

func take_damage(damage_to_take):
  health -= damage_to_take
  
  if health <= 0:
    queue_free()
    
