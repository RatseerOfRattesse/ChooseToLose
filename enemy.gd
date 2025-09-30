extends CharacterBody2D

var enemyHealth = 1
var scaleFactor = 1
@export var deathThreshhold = 0
@export var enemyspeed = 150.0
@export var rotation_enemyspeed = 5
@onready var killThySelf = get_node('../../Level/HUD')
@onready var pickDebuff = get_node('../../Level/HUD/PickDebuff')
@onready var level = get_node('../../Level')

var rotation_direction = 0

func _physics_process(delta):
	velocity = transform.x * -1 * enemyspeed
	rotation += rotation_direction * rotation_enemyspeed * delta
	move_and_slide()

func _process(_delta):
	if position.x > 0:
		pass
	else:
		#level.livingEnemies -= 1
		queue_free()
		killThySelf.damage()
	if enemyHealth < deathThreshhold:
		level.livingEnemies -= 1
		queue_free()

func takeDamage():
	enemyHealth -= 1
	
func _on_area_2d_area_entered(_area: Area2D) -> void:
	enemyHealth -= 1
	
