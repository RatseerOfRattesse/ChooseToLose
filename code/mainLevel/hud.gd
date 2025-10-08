extends Control

@export var health = 3
@onready var health1 = get_node('Health1')
@onready var health2 = get_node('Health2')
@onready var health3 = get_node('Health3')
@onready var health4 = get_node('Health4')
@onready var health5 = get_node('Health5')
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
@onready var buffScreen = get_node('pickBuff')
@onready var debuffScreen = get_node('PickDebuff')

func _ready():
	health1.hide()
	health2.hide()
	health3.hide()
	$InvertIndicator.text = 'INVERTED CONTROLS: OFF'

func damage():
	if level.ingame == true:
		health -= 1
		level.livingEnemies -= 1

func damageBE():
	if level.ingame == true:
		health -= 1
		level.bossEnemies -= 1

func _process(_delta):
	if health == 1:
		health3.hide()
		health2.hide()
		health1.show()
		health4.hide()
		health5.hide()
	elif health == 2:
		health3.hide()
		health2.show()
		health1.hide()
		health4.hide()
		health5.hide()
	elif health == 3:  
		health1.hide()
		health2.hide()
		health3.show()
		health4.hide()
		health5.hide()
	elif health == 4:
		health1.hide()
		health3.hide()
		health2.hide()
		health4.show()
		health5.hide()
	elif health == 5:
		health3.hide()
		health2.hide()
		health1.hide()
		health4.hide()
		health5.show()
	else:
		health1.hide()
		health2.hide()
		health3.hide()
		health4.hide()
		health5.hide()
		dead = true
		die()
		health = 5
	
	waveIndicator.text = "WAVE: " + str(level.wave)
	enemyIndicator.text = "ENEMIES LEFT: " + str(level.livingEnemies)
	
	if Input.is_action_just_pressed("die"):
		die()
		
	if Input.is_action_just_pressed("win"):
		win()
	
	if deathScreen.visible:
		winScreen.hide()

func die():
	if dead == true:
		deathScreen.show()
		pauseMenu.pressed = true
		nextWave.emit()
		died.emit()
	
func win():
	if not deathScreen.visible:
		winScreen.show()
		pauseMenu.pressed = true
		nextWave.emit()
		level.ingame = false
		level.enemiesLoaded = false
		level.enemyCount = 0


func _on_pick_debuff_time_to_invert() -> void:
	if debuffScreen.invert == true:
		$InvertIndicator.text = 'INVERTED CONTROLS: ON'
	else:
		$InvertIndicator.text = 'INVERTED CONTROLS: OFF'
