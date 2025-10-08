extends Node2D

@onready var startButton = get_node('../../MainMenu/Button')
@onready var health3 = get_node('HUD/Health3')
@onready var hud = get_node('HUD')
@onready var tutorial = get_node('Tutorial')
@onready var player = get_node('player2')
@onready var bossEnemy = get_node('BossEnemy')
@onready var mainMenu = get_node('../../MainMenu')
@onready var bossRoom = get_node('../BossAttackRoom')
@export var wave = 0
@export var perWaveBuff = 0
@export var enemyPerWave = wave * perWaveBuff
@export var enemyScale = 1
@export var DT = 0
@export var bigBulletRefill = 2
@export var bossEnemies = 0
@export var phaseActive = false

var ingame = false
var enemiesLoaded = false
var enemyScene = preload('res://code/entities/enemy.tscn')
var bossScene = preload('res://code/entities/boss_enemy.tscn')
var enemyCount = 0
var enemy
var boss
var livingEnemies = 0
var enemySpeed = 150.0
var enemySpawnXBottom = 1100
var enemySpawnXTop = 2100
var damageTaken = 1
var bossAlive = false
var bossEnemiesLoaded = false
var phaseTwoStarted = false

func changeDT():
	DT -= 1

func changeEnemyScale():
	enemyScale -= 0.2 * enemyScale

func _ready():
	if startButton:
		startButton.pressed.connect(on_start_pressed)

func on_start_pressed():
	self.show()
	livingEnemies = 0

func _process(_delta):
	enemyPerWave = wave * 5 + perWaveBuff
	if wave % 10 != 0:
		if enemyCount < 1:
			for i in enemyPerWave:
				spawnEnemy()
	else:
		if wave % 10 == 0 and wave != 0 and enemiesLoaded == false:
			spawnBoss()
	if livingEnemies == enemyPerWave:
		enemiesLoaded = true
		#print("win")
	if bossEnemies <= 0 and bossEnemiesLoaded == true:
		phaseActive = false
		bossEnemiesLoaded = false
	if livingEnemies == 0 && enemiesLoaded == true && ingame == true && bossAlive == false:
		hud.win()
	#print("enemiesLoaded: " + str(enemiesLoaded))a
	#print("perWaveBuff: " + str(perWaveBuff))
	if phaseTwoStarted == true:
		phaseTwoStarted = false
		initiatePhaseTwo()

func initiatePhaseTwo():
	pass
	mainMenu.doPhaseTwo()
	self.hide()
	bossRoom.doTheThing()
	print('the initiation function ran')

func spawnEnemy():
	enemy = enemyScene.instantiate()
	add_child(enemy)
	enemy.position = Vector2(randi_range(enemySpawnXBottom, enemySpawnXTop), randi_range(40,600))
	enemy.enemyspeed = enemySpeed
	enemy.damage = damageTaken
	enemy.scale = Vector2(enemyScale, enemyScale)
	enemy.deathThreshhold = DT
	enemyCount += 1
	livingEnemies = enemyCount

func spawnBoss():
	boss = bossScene.instantiate()
	add_child(boss)
	boss.position = Vector2(1200, randi_range(100, 400))
	boss.damage = damageTaken
	bossAlive = true
	enemiesLoaded = true
	pass

func spawnBossEnemies():
	for i in range(15):
		enemy = enemyScene.instantiate()
		add_child(enemy)
		enemy.position = Vector2(randi_range(enemySpawnXBottom, enemySpawnXTop), randi_range(40,600))
		enemy.enemyspeed = enemySpeed + 50
		enemy.damage = damageTaken
		enemy.doDecreaseLE = false
		enemy.doDecreaseBE = true
		enemy.scale = Vector2(enemyScale, enemyScale)
		enemy.deathThreshhold = DT - 1
		await get_tree().create_timer(0.5).timeout
		bossEnemies += 1
	bossEnemiesLoaded = true

func buffEnemyCount():
	perWaveBuff += 1

func _on_debuff_1_pressed() -> void:
	wave += 1
	ingame = true
	$HUD/PickDebuff.hide()
	player.bigBulletAllowance = bigBulletRefill

func _on_debuff_2_pressed() -> void:
	wave += 1
	ingame = true
	$HUD/PickDebuff.hide()
	player.bigBulletAllowance = bigBulletRefill

func _on_pick_debuff_enemy_speed_boost() -> void:
	#print("boost")
	enemySpeed += (enemySpeed/100)*10


func _on_buff_1_pressed() -> void:
	wave += 1
	ingame = true
	$HUD/pickBuff.hide()
	player.bigBulletAllowance = bigBulletRefill

func _on_buff_2_pressed() -> void:
	wave += 1
	ingame = true
	$HUD/pickBuff.hide()
	player.bigBulletAllowance = bigBulletRefill


func _on_pick_buff_increase_damage_taken() -> void:
	damageTaken += 0.5


func _on_boss_enemy_start_phase_two() -> void:
	print('i got the signal')
