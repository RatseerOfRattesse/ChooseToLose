extends Node2D

@onready var startButton = get_node('../../MainMenu/Button')
@onready var health3 = get_node('HUD/Health3')
@onready var hud = get_node('HUD')
@onready var tutorial = get_node('Tutorial')
@export var wave = 0
@export var perWaveBuff = 0
@export var enemyPerWave = wave * perWaveBuff

var ingame = false
var enemiesLoaded = false
var enemyScene = preload('res://code/entities/enemy.tscn')
var enemyCount = 0
var enemy
var livingEnemies = 0

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
	if livingEnemies == 0 && enemiesLoaded == true && ingame == true:
		hud.win()
		print("confirm")
	print("enemiesLoaded: " + str(enemiesLoaded))
	print("ingame: " + str(ingame))
	print("livingEnemies: " + str(livingEnemies))
	print("perWaveBuff: " + str(perWaveBuff))

func spawnEnemy():
	enemy = enemyScene.instantiate()
	add_child(enemy)
	enemy.position = Vector2(randi_range(1100, 2100), randi_range(40,600))
	enemyCount += 1
	livingEnemies = enemyCount

func buffEnemyCount():
	perWaveBuff += 1

func _on_debuff_1_pressed() -> void:
	wave += 1
	ingame = true
	$HUD/PickDebuff.hide()

func _on_debuff_2_pressed() -> void:
	wave += 1
	ingame = true
	$HUD/PickDebuff.hide()
