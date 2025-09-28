extends CharacterBody2D

@onready var collision = get_node('res://code/entities/Bullet.tscn')
var enemyHealth = 3
var scaleFactor = 1
@export var speed = 150
@export var rotation_speed = 5
@onready var waves = get_node('res://code/mainLevel/level.gd')
@onready var killThySelf = get_node('../../Level/HUD')
@onready var level = get_node('../../Level')

var rotation_direction = 0

func _ready():
	print(level.livingEnemies)

func _physics_process(delta):
	velocity = transform.x * -1 * speed
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()

func _process(_delta):
	print(level.livingEnemies)
	success()
	if enemyHealth < 1:
		queue_free()
		if level.livingEnemies == 3:
			level.livingEnemies -= 3
		else:
			level.livingEnemies -= 1

func success():
	#if $VisibleOnScreenNotifier2D.is_on_screen():
	if position.x > 0:
		pass
	else:
		queue_free()
		killThySelf.damage()
		level.livingEnemies -= 1
		
func takeDamage():
	enemyHealth -= 1
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	enemyHealth -= 1
