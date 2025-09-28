extends Control

@export var health = 4
@onready var health1 = get_node('Health1')
@onready var health2 = get_node('Health2')
@onready var health3 = get_node('Health3')
var healthIndicator = [health1, health2, health3]
@onready var waveIndicator = get_node('WaveIndicator')
@onready var deathScreen = get_node('DeathScreen')
@onready var winScreen = get_node('WinScreen')
@onready var level = get_node("../../Level")

func _ready():
	health1.hide()
	health2.hide()
	health3.hide()

func damage():
	health -= 1
	
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
	elif health == 4:
		health1.hide()
		health2.hide()
		health3.show()
	else:
		die()
	
	waveIndicator.text = "WAVE: " + str(level.wave)
	
	if Input.is_action_just_pressed("die"):
		die()
		
	if Input.is_action_just_pressed("win"):
		win()

func die():
	deathScreen.show()
	get_tree().paused = true
	
func win():
	winScreen.show()
	get_tree().paused = true
