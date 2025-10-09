extends CharacterBody2D

@export var speed = 400
@export var invertControls = 1
var bulletScene = preload("res://code/entities/Bullet.tscn")
var bigBulletScene = preload("res://code/entities/BigBullet.tscn")
@onready var level = get_node("../../Level")
var bigBulletAllowance = 2
var bulletSpeed = 0.03
signal bulletShot
signal bigBulletShot

func _ready():
	position = Vector2(581,324)

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed * invertControls

func _physics_process(_delta):
	get_input()
	move_and_slide()

func _process(_delta):
	if Input.is_action_just_pressed("shoot"):
		spawn_bullet()
	if Input.is_action_just_pressed("big shoot"):
		spawnBigBullet()
	if position.x > 1152:
		position.x -= 10
		
	if position.y > 648:
		position.y -= 10
		
	if position.x < 0:
		position.x += 10
		
	if position.y < 0:
		position.y += 10

func spawn_bullet():
	if level.ingame == true:
		var bullet = bulletScene.instantiate()
		owner.add_child(bullet)
		bullet.position = $Marker2D.global_position
		bullet.bulletSpeed = bulletSpeed
		bulletShot.emit()

func spawnBigBullet():
	if level.ingame == true:
		if bigBulletAllowance > 0:
			var bigBullet = bigBulletScene.instantiate()
			owner.add_child(bigBullet)
			bigBullet.scale = Vector2(2,2)
			bigBullet.position = $Marker2D.global_position
			bigBulletAllowance -= 1
			bigBulletShot.emit()
		
func decreaseBulletSpeed():
	bulletSpeed += 0.01
