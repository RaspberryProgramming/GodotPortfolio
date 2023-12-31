extends Area2D

@export var startTile : bool = false

var hasBuilding : bool = false
var canPlaceBuilding : bool = false

# components
@onready var highlight : Sprite2D = get_node("Hightlight")
@onready var buildingIcon : Sprite2D = get_node("BuildingIcon")
  
func toggle_highlight(toggle):
  
  highlight.visible = toggle
  canPlaceBuilding = toggle
  
func place_building(buildingTexture):
  hasBuilding = true
  buildingIcon.texture = buildingTexture

func _on_input_event(viewport, event, shape_idx):
  
  if event is InputEventMouseButton and event.pressed:
    var gameManager = get_node("/root/MainScene")
    
    if gameManager.currentlyPlacingBuilding and canPlaceBuilding:
      gameManager.place_building(self)
      
