extends CharacterBody2D

var speed = 2
@onready var player = get_node('../playerBossVer/Area2D')
@onready var bossRoom = get_node('../../BossAttackRoom')
var cardinality = 'north'

func _ready():
	pass

func _process(_delta):
	if cardinality == 'south':
		position.y -= speed
	elif cardinality == 'north':
		position.y += speed
	elif cardinality == 'west':
		position.x += speed
	elif cardinality == 'east':
		position.x -= speed

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	bossRoom.enemiesLeft -= 1

func _on_area_2d_area_entered(_area: Area2D) -> void:
	queue_free()
	bossRoom.enemiesLeft -= 1
