extends ProgressBar

@onready var level = get_node("../../Level")

var bossSpawned = false

func _ready():
	hide()

func _process(_delta):
	if bossSpawned == true:
		await get_tree().create_timer(2).timeout
		if bossSpawned == true:
			value = level.boss.bossHealth
	else:
		value = 0
		hide()

func _on_level_boss_spawned() -> void:
	show()
	bossSpawned = true
