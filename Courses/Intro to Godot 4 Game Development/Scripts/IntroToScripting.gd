extends Node2D

var score : int = 5

# Called when the node enters the scene tree for the first time.
func _ready():
  if score == 10:
    print("You win!")
  
  if score > 5:
    print("Score is greater than 5")
    
  var a : int = 50
  var b : int = 100

  if a < b:
    print("a is less than b")  

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  pass
