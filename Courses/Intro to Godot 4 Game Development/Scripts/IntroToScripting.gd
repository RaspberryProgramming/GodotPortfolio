extends Node2D

var score : int = 5
var move_speed : float = 2.53
var game_over : bool = false
var ability : String = "slash"

# Called when the node enters the scene tree for the first time.
func _ready():
  game_over = true
  print(game_over)
  ability = "heal"
  print(ability)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  pass
