extends CharacterBody2D

var health = 3
var scaleFactor = 1
@export var speed = 150
@export var rotation_speed = 5
@onready var waves = get_node('res://code/mainLevel/level.gd')

var rotation_direction = 0

func _physics_process(delta):
	velocity = transform.x * -1 * speed
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
