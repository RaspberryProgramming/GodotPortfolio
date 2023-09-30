extends Node2D

var score : int = 75

# Called when the node enters the scene tree for the first time.
func _ready():
  var game_over = _has_won(120)
  print(game_over)
  
func _has_won(score):
  if score >= 100:
    return true
  else:
    return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  pass
