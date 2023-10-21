extends Control

@onready var healthbar : TextureProgressBar = get_node("HealthBar")
@onready var ammoText : Label = get_node("AmmoText")
@onready var scoreText : Label = get_node("ScoreText")

func update_health_bar(curHp:int, maxHp:int):
  healthbar.max_value = maxHp
  healthbar.value = curHp

func update_ammo_text(ammo:int):
  ammoText.text = str("Ammo: ", ammo)

func update_score_text(score:int):
  scoreText.text = str("Score: ", score)
