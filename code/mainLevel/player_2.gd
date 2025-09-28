extends CharacterBody2D

@export var speed = 400
var bulletScene = preload("res://code/entities/Bullet.tscn")

func _ready():
	position = Vector2(581,324)

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()

func _process(_delta):
	if Input.is_action_just_pressed("shoot"):
		spawn_bullet()
		
	if position.x > 1152:
		position.x -= 10
		
	if position.y > 648:
		position.y -= 10
		
	if position.x < 0:
		position.x += 10
		
	if position.y < 0:
		position.y += 10
		
func spawn_bullet():
	var bullet = bulletScene.instantiate()
	add_child(bullet)
