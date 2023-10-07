extends Node2D

func _ready():
  var score:int = 0
  for i in 10:
    score += 5

  print(score)
