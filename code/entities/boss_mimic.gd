extends CharacterBody2D

var rotation_direction = 0
var bossSpawned

@onready var level = get_node("../../Level")

func _ready():
	hide()
	
func _physics_process(delta):
	velocity = transform.x * -1 * 25
	rotation += rotation_direction * 5 * delta
	move_and_slide()

#WHY THE FUCK YOU NO WORK
func _process(_delta):
	if bossSpawned == true:
		if level.boss.bossDead == true:
			hide()


func _on_level_boss_spawned() -> void:
	bossSpawned = true
