extends Node2D

var ingame = false
@onready var startButton = get_node('../../MainMenu/Button')
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

func _process(delta):
	if enemyCount < wave * 5:
		spawnEnemy()

func spawnEnemy():
	
	var enemy = enemyScene.instantiate()
	add_child(enemy)
	enemy.position = Vector2(1162, randi_range(1,500))
	enemyCount += 1
