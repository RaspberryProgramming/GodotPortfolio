extends CharacterBody2D

var curHp : int = 10;
var maxHp : int = 10;
var moveSpeed : int = 250;
var damage : int = 1;

var gold : int = 0;

var curLevel : int = 0;
var curXp : int = 0;
var xpToNextLevel : int = 50;
var xpToNextLevelIncreaseRate : float = 1.2;

var interactDist : int = 70;

var vel : Vector2 = Vector2();
var facingDir : Vector2 = Vector2();

@onready var rayCast : RayCast2D = get_node("RayCast2D");
@onready var sprite : AnimatedSprite2D = get_node("Sprite");

func _physics_process(delta):
  velocity = Vector2();
  
  # inputs
  if Input.is_action_pressed("move_up"):
    velocity.y -= 1;
    facingDir = Vector2(0, -1);
  if Input.is_action_pressed("move_down"):
    velocity.y += 1;
    facingDir = Vector2(0, 1);
  if Input.is_action_pressed("move_left"):
    velocity.x -= 1;
    facingDir = Vector2(-1, 0);
  if Input.is_action_pressed("move_right"):
    velocity.x += 1;
    facingDir = Vector2(1, 0);
  
  velocity = velocity.normalized();
  velocity *= moveSpeed; # Apply moveSpeed to velocity
  
  # Move the player
  move_and_slide();
  
  # Apply animation to player based on current movement
  manage_animations();

func manage_animations():
  # Movement Animations
  if velocity.x > 0:
    play_animation("MoveRight");
  elif velocity.x < 0:
    play_animation("MoveLeft");
  elif velocity.y < 0:
    play_animation("MoveUp");
  elif velocity.y > 0:
    play_animation("MoveDown");
    
  # Idle Animations
  elif facingDir.x == 1:
    play_animation("IdleRight");
  elif facingDir.x == -1:
    play_animation("IdleLeft");
  elif facingDir.y == -1:
    play_animation("IdleUp");
  elif facingDir.y == 1:
    play_animation("IdleDown");
  
func _process(delta):
    
    if Input.is_action_just_pressed("interact"):
      try_interact();
      
func try_interact():
  rayCast.target_position = facingDir * interactDist;
  
  if rayCast.is_colliding():
    if rayCast.get_collider() is CharacterBody2D:
      rayCast.get_collider().take_damage(damage);
    elif rayCast.get_collider().has_method("on_interact"):
      rayCast.get_collider().on_interact(self);
      
func play_animation(animation_name):
  # Play animation if not already playing
  if sprite.animation != animation_name:
    sprite.play(animation_name);

func give_xp(amount):
  
  curXp += amount
  
  if curXp >= xpToNextLevel:
    level_up();
    
func level_up():
  
  var overflowXp = curXp - xpToNextLevel;
  
  xpToNextLevel *= xpToNextLevelIncreaseRate;
  
  curXp = overflowXp;
  
  curLevel += 1;

func give_gold(amount):
  gold += amount;

func take_damage(dmgToTake):
  curHp -= dmgToTake;
  
  if curHp <= 0:
    die();
    
func die():
  get_tree().reload_current_scene();
