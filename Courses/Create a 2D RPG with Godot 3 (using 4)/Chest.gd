extends StaticBody2D

var goldToGive : int = 5;

func on_interact(body:Node2D):
  body.give_gold(goldToGive);
  
  queue_free();
