extends CharacterBody2D

@onready var collision = get_node('res://code/entities/Bullet.tscn')
var health = 3
var scaleFactor = 1
@export var speed = 150
@export var rotation_speed = 5
@onready var waves = get_node('res://code/mainLevel/level.gd')

var rotation_direction = 0

func _ready():
	if collision:
		collision.area_entered.connect(takeDamage)

func _physics_process(delta):
	velocity = transform.x * -1 * speed
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()

func _process(delta):
	success()
	if health < 1:
		queue_free

func success():
	if $VisibleOnScreenNotifier2D.is_on_screen():
		pass
	else:
		queue_free()

func takeDamage():
	health -= 1
