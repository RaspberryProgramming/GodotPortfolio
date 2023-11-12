extends Area3D

@export var goldToGive : int = 1;
var rotateSpeed : float = 5.0;

func _process(delta):
  rotate_y(rotateSpeed * delta );


func _on_body_entered(body):
  if body.name == "Player":
    body.give_gold(goldToGive);
    queue_free();
