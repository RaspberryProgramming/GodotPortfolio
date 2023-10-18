extends VBoxContainer

@export var buttons : Array[NodePath]

# Called when the node enters the scene tree for the first time.
func _ready():
  get_node("/root/BattleScene").character_begin_turn.connect(_on_character_begin_turn)
  get_node("/root/BattleScene").character_end_turn.connect(_on_character_end_turn)
  
func _on_character_begin_turn(character):
  visible = character.is_player
  
  if character.is_player:
    _display_combat_actions(character.combat_actions)
  
func _on_character_end_turn(character):
  visible = false

func _display_combat_actions(combat_actions):
  for i in len(buttons):
    var button = get_node(buttons[i])
    
    if i < len(combat_actions):
      button.visible = true
      button.text = combat_actions[i].display_name
      button.combat_action = combat_actions[i]
    else:
      button.visible = false
