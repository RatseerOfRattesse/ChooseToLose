extends Node2D

var livingFoes = 0
@onready var arrowEnemy = preload('res://code/entities/arrow_enemy.tscn')
@onready var player = get_node('playerBossVer')
@onready var level = get_node('../Level')
@onready var boss = get_node('../Level/BossEnemy')
var temp
var randomThing
@export var enemiesLeft = 0
var enemiesSpawned = false
var speedModifier = 0
var spawnWait = 1

func _ready():
	self.hide()

func doTheThing():
	await get_tree().create_timer(3).timeout
	for i in range(20):
		await get_tree().create_timer(spawnWait).timeout
		randomThing = randi_range(0,3)
		spawnArrowEnemy(randomThing)
		enemiesLeft += 1
		speedModifier += 1
	enemiesSpawned = true

func _process(_delta):
	pass
	if enemiesSpawned == true and enemiesLeft < 1:
		self.hide()
		level.show()
		await get_tree().create_timer(3).timeout
		level.phaseActive = false
		
	if speedModifier > 9:
		spawnWait = 0.5

func spawnArrowEnemy(cardinality):
	temp = arrowEnemy.instantiate()
	if cardinality == 0:
		temp.cardinality = 'north'
		temp.position = Vector2(player.position.x,24)
	elif cardinality == 1:
		temp.cardinality = 'east'
		temp.position = Vector2(881, player.position.y)
		temp.rotate(1.570796)
	elif cardinality == 2:
		temp.cardinality = 'south'
		temp.position = Vector2(player.position.x, 624)
		temp.rotate(2 * 1.570796)
	elif cardinality == 3:
		temp.cardinality = 'west'
		temp.position = Vector2(281, player.position.y)
		temp.rotate(3*1.570796)
	if speedModifier > 9:
		temp.speed = 3
	add_child(temp)
