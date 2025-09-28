extends Node2D

var ingame = false
@onready var startButton = get_node('../../MainMenu/Button')
@onready var health3 = get_node('HUD/Health3')
@onready var hud = get_node('HUD')
@onready var tutorial = get_node('Tutorial')
@export var wave = 0
@export var perWaveBuff = 5
@export var enemyPerWave = wave * perWaveBuff

var enemyScene = preload('res://code/entities/enemy.tscn')
var enemyCount = 0
var livingEnemies = 2
var enemy

func _ready():
	if startButton:
		startButton.pressed.connect(on_start_pressed)
		
func on_start_pressed():
	self.show()
	ingame = true
	if tutorial.done == true:
		wave += 1

func _process(_delta):
	enemyPerWave = wave * perWaveBuff
	if enemyCount < 1:
		for i in enemyPerWave:
			spawnEnemy()
			await get_tree().create_timer(0.5).timeout
	if livingEnemies == -1:
		hud.win()
		enemyCount = 0
		livingEnemies = 1

func spawnEnemy():
	enemy = enemyScene.instantiate()
	add_child(enemy)
	enemy.position = Vector2(1100, randi_range(40,600))
	enemyCount += 1
	livingEnemies += 1

func buffEnemyCount():
	perWaveBuff += 1

func _on_debuff_1_pressed() -> void:
	wave += 1
	$HUD/PickDebuff.hide()

func _on_debuff_2_pressed() -> void:
	wave += 1
	$HUD/PickDebuff.hide()
