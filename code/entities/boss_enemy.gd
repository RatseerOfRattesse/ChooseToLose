extends CharacterBody2D

var bossSpeed = 25
var bossHealth = 100
var rotation_enemyspeed = 5
var rotation_direction = 0
var moving = true
var remainingPhases = 3
var takeDamage = true
var phase3Position = [100,200,300,400,500]
#var phaseActive = false
@export var autopsy = false
@export var mimicMode = false

@onready var level = get_node('../../Level')
@onready var accessHUD = get_node('../../Level/HUD')
@onready var bossSprite = get_node('bossSprite')
@onready var bossDamagedSFX = get_node('BossDamaged')
@onready var bossDiedSFX = get_node('BossDied')
@onready var healthBar = get_node("../ProgressBar")
@onready var mimic = get_node("../BossMimic")

var bossDead = false
#Make sure damage variable is also incrased for the bullet buff
@export var damage = 1

func _ready():
	#print(level)
	pass
	level.iHateMimics = false
	#print(accessHUD)

func _physics_process(delta):
	if bossDead == false:
		if moving == true:
			velocity = transform.x * -1 * bossSpeed
			rotation += rotation_direction * rotation_enemyspeed * delta
			move_and_slide()

func _process(_delta):
	#print(bossHealth)
	if position.x > -100:
		pass
	else:
		if mimicMode == false:
			if level.ingame == true:
				for i in accessHUD.health + 3:
					print('this is supposed to take off damage')
					accessHUD.health -= 1
		queue_free()
	if bossHealth < 0:
		bossDead = true
		if mimicMode == false:
			bossDiedSFX.play()
			bossSprite.play("death")
		healthBar.bossSpawned = false
		level.iHateMimics = true
		#await get_tree().create_timer(7).timeout
		if mimicMode == false:
			level.bossAnimDone = true
		await get_tree().create_timer(4.5).timeout
		bossSprite.stop()
		autopsy = true
		accessHUD.win()
		level.bossAlive = false
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
		bossSpeed = 25
		takeDamage = true
	if mimicMode == true:
		if level.iHateMimics == true:
			queue_free()

func _on_boss_area_area_entered(_area: Area2D) -> void:
	if takeDamage == true:
		if mimicMode == false:
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
	level.alternateMimicSpawn()
	position.y = phase3Position[randi_range(0,4)]
