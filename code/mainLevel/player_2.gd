extends CharacterBody2D

@export var speed = 400
var bulletScene = preload("res://code/entities/Bullet.tscn")

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()

func _process(_delta):
	if Input.is_action_just_pressed("shoot"):
		spawn_bullet()
		print("spawned")
		
func spawn_bullet():
	var bullet = bulletScene.instantiate()
	add_child(bullet)
	#bullet.global_position = self.position
