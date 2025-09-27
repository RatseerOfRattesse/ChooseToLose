extends CharacterBody2D

var health = 3
var scaleFactor = 1
@export var speed = 200
@export var rotation_speed = 5

var rotation_direction = 0

func get_input():
	rotation_direction = Input.get_axis("left", "right")
	print(Input.get_axis('left', 'right'))
	velocity = transform.x * -1 * speed

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
