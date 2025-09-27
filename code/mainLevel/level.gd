extends Node2D

var ingame = false
@onready var startButton = get_node('../../MainMenu/Button')
@onready var health3 = get_node('HUD/Health3')
@export var wave = 0
var enemyScene = preload('res://code/entities/enemy.tscn')
var enemyCount = 0

func _ready():
	if startButton:
		startButton.pressed.connect(on_start_pressed)
		
func on_start_pressed():
	self.show()
	ingame = true
	wave += 1

func _process(_delta):
	if enemyCount < wave * 5:
		spawnEnemy()
		await get_tree().create_timer(0.5).timeout

func spawnEnemy():
	
	var enemy = enemyScene.instantiate()
	add_child(enemy)
	enemy.position = Vector2(1162, randi_range(1,648))
	enemyCount += 1
