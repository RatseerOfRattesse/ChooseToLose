extends CharacterBody2D

var bossSpeed = 50
var bossHealth = 100
var rotation_enemyspeed = 5
var rotation_direction = 0
var moving = true
var remainingPhases = 3
var takeDamage = true
#var phaseActive = false
@export var autopsy = false

@onready var level = get_node('../../Level')
@onready var accessHUD = get_node('../../Level/HUD')
@onready var bossSprite = get_node('bossSprite')
@onready var bossDamagedSFX = get_node('BossDamaged')
@onready var bossDiedSFX = get_node('BossDied')

#Make sure damage variable is also incrased for the bullet buff
@export var damage = 1

signal startPhaseTwo
signal bossDamaged
signal bossDied

func _ready():
	#print(level)
	print(bossDiedSFX)
	pass

	#print(accessHUD)

func _physics_process(delta):
	if moving == true:
		velocity = transform.x * -1 * bossSpeed
		rotation += rotation_direction * rotation_enemyspeed * delta
		move_and_slide()

func _process(_delta):
	#print(bossHealth)
	if position.x > -100:
		pass
	else:
		if level.ingame == true:
			for i in accessHUD.health + 3:
				print('this is supposed to take off damage')
				accessHUD.health -= 1
		queue_free()
	if Input.is_action_just_pressed("kill_boss"):
		bossHealth = 0
	if bossHealth < 0:
		bossDiedSFX.play()
		bossSprite.play("death")
		await get_tree().create_timer(7).timeout
		autopsy = true
		accessHUD.win()
		queue_free()
	if remainingPhases == 3 and bossHealth <= 75:
		remainingPhases = 2
		phaseOne()
	if remainingPhases == 2 and bossHealth <= 50:
		remainingPhases = 1
		phaseTwo()
	if remainingPhases == 1 and bossHealth <= 25:
		remainingPhases = 0
		phaseThree()
	if level.phaseActive == true:
		bossSpeed = 0
		takeDamage = false
	else:
		bossSpeed = 50
		takeDamage = true

func _on_boss_area_area_entered(_area: Area2D) -> void:
	if takeDamage == true:
		bossHealth -= damage
		bossDamagedSFX.play()

func phaseOne():
	pass
	level.phaseActive = true
	print('phase 1 worked')
	level.spawnBossEnemies()
	#what is going to happen at 75% health

func phaseTwo():
	pass
	level.phaseActive = true
	level.phaseTwoStarted = true
	print('phase 2 worked')
	#what is going to happen at 50% health

func phaseThree():
	pass
	print('phase 3 worked')
	#you get the fucking point
