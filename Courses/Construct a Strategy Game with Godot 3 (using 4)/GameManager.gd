extends Node2D

var curFood : int = 0
var curMetal : int = 0
var curOxygen : int = 0
var curEnergy : int = 0

var foodPerTurn : int = 0
var metalPerTurn : int = 0
var oxygenPerTurn : int = 0
var energyPerTurn : int = 0

var curTurn : int = 1
var currentlyPlacingBuilding : bool = false

var buildingToPlace : int

# components
@onready var ui : Node = get_node("UI")
@onready var map : Node = get_node("Tiles")

func on_select_building(buildingType):
  
  currentlyPlacingBuilding = true
  buildingToPlace = buildingType
  
  map.highlight_available_tiles()
  
func add_to_resource_per_turn(resource, amount):
  if resource == 0:
    return
  elif resource == 1:
    foodPerTurn += amount
  elif resource == 2:
    metalPerTurn += amount
  elif resource == 3:
    oxygenPerTurn += amount
  elif resource == 4:
    energyPerTurn += amount
    
func place_building(tileToPlaceOn):
  
  currentlyPlacingBuilding = false
  
  var texture : Texture
  
  # are we placing down a Mine?
  if buildingToPlace == 1:
    texture = BuildingData.mine.iconTexture
    
    add_to_resource_per_turn(BuildingData.mine.prodResource, BuildingData.mine.prodResourceAmount)
    add_to_resource_per_turn(BuildingData.mine.upkeepResource, BuildingData.mine.upkeepResourceAmount)
  
  # are we placing down a Greenhouse?
  if buildingToPlace == 1:
    texture = BuildingData.greenhouse.iconTexture
    
    add_to_resource_per_turn(BuildingData.greenhouse.prodResource, BuildingData.greenhouse.prodResourceAmount)
    add_to_resource_per_turn(BuildingData.greenhouse.upkeepResource, BuildingData.greenhouse.upkeepResourceAmount)
    
  # are we placing down a SolarPanel?
  if buildingToPlace == 1:
    texture = BuildingData.solarpanel.iconTexture
    
    add_to_resource_per_turn(BuildingData.solarpanel.prodResource, BuildingData.solarpanel.prodResourceAmount)
    add_to_resource_per_turn(BuildingData.solarpanel.upkeepResource, BuildingData.solarpanel.upkeepResourceAmount)
    
    
