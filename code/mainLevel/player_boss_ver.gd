extends CharacterBody2D

@export var speed = 0
@export var rotation_speed = 90
@export var health = 3
@onready var hud = get_node('../../Level/HUD')
@onready var level = get_node('../../Level')
@onready var bossRoom = get_node('../../BossAttackRoom')
@onready var deathScreen = get_node('../../Level/HUD/DeathScreen')

func _ready():
	print(deathScreen)

func _input(event):
	if event.is_action_pressed('left'):
		rotate(1.570796 * 3)
	if event.is_action_pressed('right'):
		rotate(1.570796)

func _process(_delta):
	if health < 1:
		pass
		#death screen trigger
		bossRoom.hide()
		deathScreen.show()
		level.show()
		hud.die()

func _on_area_2d_area_entered(_area: Area2D) -> void:
	health -= 1
