extends CharacterBody2D

var enemyspeed = 10
var bossHealth = 100
var rotation_enemyspeed = 5
var rotation_direction = 0
var moving = true
var remainingPhases = 3
@export var autopsy = false

#Make sure damage variable is also incrased for the bullet buff
var damage = 1

func _physics_process(delta):
	if moving == true:
		velocity = transform.x * -1 * enemyspeed
		rotation += rotation_direction * rotation_enemyspeed * delta
		move_and_slide()

func _process(_delta):
	if position.x > 0:
		pass
	else:
		pass
		#Code all the funky killThySelf shit here
	if bossHealth < 0:
		queue_free()
		autopsy = true
	if remainingPhases == 3 and bossHealth <= 75:
		remainingPhases = 2
		phaseOne()
	if remainingPhases == 2 and bossHealth <= 50:
		remainingPhases = 1
		phaseTwo()
	if remainingPhases == 1 and bossHealth <= 25:
		remainingPhases = 0
		phaseThree()

func _on_boss_area_area_entered(_area: Area2D) -> void:
	bossHealth -= damage

func phaseOne():
	pass
	print('phase 1 worked')
	#what is going to happen at 75% health

func phaseTwo():
	pass
	print('phase 2 worked')
	#what is going to happen at 50% health

func phaseThree():
	pass
	print('phase 3 worked')
	#you get the fucking point
