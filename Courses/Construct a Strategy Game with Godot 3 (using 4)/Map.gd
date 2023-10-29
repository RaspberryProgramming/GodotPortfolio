extends Node

var allTiles : Array
var tilesWithBuildings : Array
var tileSize : float = 64.0

func get_tile_at_position(position):
  
  for x in range(len(allTiles)):
    if allTiles[x].position == position and !allTiles[x].hasBuilding:
      return allTiles[x]

  return null
  
func disable_tile_highlights():
  for x in range(len(allTiles)):
    allTiles[x].toggle_highlight(false)
    
func highlight_available_tiles():
  for x in range(len(tilesWithBuildings)):
    var northTile = get_tile_at_position(tilesWithBuildings[x].position + Vector2(0, tileSize))
    var southTile = get_tile_at_position(tilesWithBuildings[x].position + Vector2(0, -tileSize))
    var eastTile = get_tile_at_position(tilesWithBuildings[x].position + Vector2(tileSize, 0))
    var westTile = get_tile_at_position(tilesWithBuildings[x].position + Vector2(-tileSize, 0))
    
    if northTile != null:
      northTile.toggle_highlight(true)
    if southTile != null:
      southTile.toggle_highlight(true)
    if eastTile != null:
      eastTile.toggle_highlight(true)
    if westTile != null:
      westTile.toggle_highlight(true)
