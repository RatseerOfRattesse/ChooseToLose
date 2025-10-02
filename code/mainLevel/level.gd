extends Node2D

@onready var startButton = get_node('../../MainMenu/Button')
@onready var health3 = get_node('HUD/Health3')
@onready var hud = get_node('HUD')
@onready var tutorial = get_node('Tutorial')
@onready var player = get_node('player2')
@export var wave = 0
@export var perWaveBuff = 0
@export var enemyPerWave = wave * perWaveBuff
@export var enemyScale = 1
@export var DT = 0
@export var bigBulletRefill = 2

var ingame = false
var enemiesLoaded = false
var enemyScene = preload('res://code/entities/enemy.tscn')
var enemyCount = 0
var enemy
var livingEnemies = 0
var enemySpeed = 150.0
var enemySpawnXBottom = 1100
var enemySpawnXTop = 2100
var damageTaken = 1

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
	if enemyCount < 1:
		for i in enemyPerWave:
			spawnEnemy()
	if livingEnemies == enemyPerWave:
		enemiesLoaded = true
		#print("win")
	if livingEnemies == 0 && enemiesLoaded == true && ingame == true:
		hud.win()
	#print("enemiesLoaded: " + str(enemiesLoaded))
	#print("ingame: " + str(ingame))
	#print("livingEnemies: " + str(livingEnemies))
	#print("perWaveBuff: " + str(perWaveBuff))

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
	damageTaken += 1
