extends Area3D

@export var clicks_to_pop : int = 3 # Can add @export to allow specifying for each individual balloon
@export var size_increase : float = 0.2
@export var score_to_give : int = 1



func _on_input_event(camera: Node, event: InputEvent, position: Vector3, normal: Vector3, shape_idx: int):
  if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
    scale += Vector3.ONE*size_increase
    clicks_to_pop -= 1
    
    if clicks_to_pop == 0:
      get_node("/root/Main").increase_score(score_to_give)
      queue_free()
