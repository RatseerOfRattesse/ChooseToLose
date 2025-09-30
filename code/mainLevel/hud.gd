extends Control

@export var health = 4
@onready var health1 = get_node('Health1')
@onready var health2 = get_node('Health2')
@onready var health3 = get_node('Health3')
var healthIndicator = [health1, health2, health3]
signal nextWave
signal died
var dead = false
@onready var waveIndicator = get_node('WaveIndicator')
@onready var enemyIndicator = get_node('EnemyIndicator')
@onready var deathScreen = get_node('DeathScreen')
@onready var winScreen = get_node('WinScreen')
@onready var level = get_node("../../Level")
@onready var pauseMenu = get_node("../PauseMenu") 

func _ready():
	health1.hide()
	health2.hide()
	health3.hide()

func damage():
	health -= 1
	level.livingEnemies -= 1
	
func _process(_delta):
	if health == 3:  
		health1.hide()
		health2.hide()
		health3.show()
	elif health == 2:
		health1.hide()
		health3.hide()
		health2.show()
	elif health == 1:
		health3.hide()
		health2.hide()
		health1.show()
	# hp 4 and 5 for technical purposes
	elif health == 4:
		health1.hide()
		health2.hide()
		health3.show()
	elif health == 5:
		health1.hide()
		health2.hide()
		health3.hide()
	else:
		health1.hide()
		health2.hide()
		health3.hide()
		dead = true
		die()
		health = 5
	
	waveIndicator.text = "WAVE: " + str(level.wave)
	enemyIndicator.text = "ENEMIES LEFT: " + str(level.livingEnemies)
	
	if Input.is_action_just_pressed("die"):
		die()
		
	if Input.is_action_just_pressed("win"):
		win()

func die():
	if dead == true:
		deathScreen.show()
		pauseMenu.pressed = true
		nextWave.emit()
		died.emit()
	
func win():
	winScreen.show()
	pauseMenu.pressed = true
	nextWave.emit()
	level.ingame = false
	level.enemiesLoaded = false
	level.enemyCount = 0
