extends CharacterBody2D

var health = 3
var scaleFactor = 1
@export var speed = 150
@export var rotation_speed = 5
@onready var level = get_node('../../Level')

var rotation_direction = 0

func _physics_process(delta):
	velocity = transform.x * -1 * speed
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()

func _process(_delta):
	success()
	print(level)
	if health < 1:
		queue_free()
		level.livingEnemies -= 1

func success():
	if $VisibleOnScreenNotifier2D.is_on_screen():
		pass
	else:
		queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	health -= 1
