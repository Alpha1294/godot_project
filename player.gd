extends CharacterBody2D

var speed = 100

@export var inv: Inv

func _physics_process(delta):
	velocity = Vector2.ZERO
	
	var is_moving = false
	
	if Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.play("sides")
		$AnimatedSprite2D.flip_h = false
		velocity.x = speed
		is_moving = true
		
	if Input.is_action_pressed("move_left"):
		$AnimatedSprite2D.play("sides")
		$AnimatedSprite2D.flip_h = true
		velocity.x = -speed
		is_moving = true
	
	if Input.is_action_pressed("move_up"):
		$AnimatedSprite2D.play("upside")
		velocity.y = -speed
		is_moving = true
	
	if Input.is_action_pressed("move_down"):
		$AnimatedSprite2D.play("down_side")
		velocity.y = speed
		is_moving = true
	if not is_moving:
		$AnimatedSprite2D.play("idle")
	
	move_and_slide()


func player():
	pass
	
func collect(item):
	inv.insert(item)
