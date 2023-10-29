extends Node

var base : Building = Building.new(0, preload("res://Sprites/Base.png"), 0, 0, 0, 0)
var mine : Building = Building.new(1, preload("res://Sprites/Mine.png"), 2, 1, 4, -1)
var greenhouse : Building = Building.new(2, preload("res://Sprites/Greenhouse.png"), 1, 1, 0, 0)
var solarpanel : Building = Building.new(3, preload("res://Sprites/SolarPanel.png"), 4, 1, 0, 0)

class Building:
  # building type
  var type : int
  
  # building texture
  var iconTexture :  Texture
  
  # resources the building produces
  var prodResource : int = 0
  var prodResourceAmount : int
  
  # resource the building needs to be maintained
  var upkeepResource : int = 0
  var upkeepResourceAmount : int
  
  func _init(type, iconTexture, prodResource, prodResourceAmount, upkeepResource, upkeepResourceAmount):
    
    self.type = type
    self.iconTexture = iconTexture
    self.prodResource = prodResource
    self.prodResourceAmount = prodResourceAmount
    self.upkeepResource = upkeepResource
    self.upkeepResourceAmount = upkeepResourceAmount
    
    
