extends Control

@onready var levelText : Label = get_node("BG/LevelBG/LevelText");
@onready var healthBar : TextureProgressBar = get_node("BG/Healthbar");
@onready var xpBar : TextureProgressBar = get_node("BG/XpBar");
@onready var goldText : Label = get_node("BG/GoldText");

func update_level_text(level):
  levelText.text = str(level);

func update_health_bar(curHp, maxHp):
  healthBar.value = (100/maxHp)*curHp;
  
func update_xp_bar(curXp, xpToNextLevel):
  
  xpBar.value = (100/xpToNextLevel)*curXp;
  
func update_gold_text(gold):
  goldText.text = str("Gold: ", gold);
