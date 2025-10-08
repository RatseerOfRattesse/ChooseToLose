extends CharacterBody2D

var enemyHealth = 1.5
var scaleFactor = 1
@export var damage = 1
@export var deathThreshhold = 0
@export var enemyspeed = 150.0
@export var doDecreaseLE = true
@export var doDecreaseBE = false
@export var rotation_enemyspeed = 5
@onready var killThySelf = get_node('../../Level/HUD')
@onready var pickDebuff = get_node('../../Level/HUD/PickDebuff')
@onready var level = get_node('../../Level')
@onready var deathSound = get_node('../enemyDied')


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
		if doDecreaseLE == true:
			killThySelf.damage()
		if doDecreaseBE == true:
			killThySelf.damageBE()
	if enemyHealth < deathThreshhold:
		if doDecreaseLE == true:
			level.livingEnemies -= 1
		if doDecreaseBE == true:
			level.bossEnemies -= 1
		deathSound.playSound()
		queue_free()
		
func _on_area_2d_area_entered(_area: Area2D) -> void:
	enemyHealth -= damage
