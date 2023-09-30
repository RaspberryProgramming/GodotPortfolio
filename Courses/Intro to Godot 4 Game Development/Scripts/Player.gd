extends Sprite2D

var _speed : float = 30; # Pix a second
var _timer : float = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
  var vec = Vector2(500, 200)
  global_position = vec


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  _timer += delta
  print(_timer)
  
  var direction = Vector2(1, 1)
  global_position += direction * (_speed * delta)
