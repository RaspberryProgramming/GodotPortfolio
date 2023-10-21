extends Area3D

var speed : float = 30.0
var damage : int = 1

func _process(delta):
  position += global_transform.basis.z * speed * delta
  print(position, global_position)

func destroy():
  queue_free()
  
func _on_bullet_body_entered(body):
  if body.has_method("take_damage"):
    body.take_damage(damage)
    destroy()
