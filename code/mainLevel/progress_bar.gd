extends ProgressBar

@onready var level = get_node("../../Level")
@onready var label = get_node("Label")

const namePrefixes = [
	'MICRO',
	'GOO',
	'AMA',
	'NVI',
	'AP',
	'YOU',
	'ME',
	'ADO',
	'INT',
	'TES',
	'DIS',
	'SAM'
]
const nameSuffixes = [
	'SOFT',
	'GLE',
	'ZON',
	'DIA',
	'PLE',
	'TUBE',
	'TA',
	'BE',
	'EL',
	'LA',
	'X',
	'NEY',
	'SUNG'
]

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
	label.text = "HERALD OF " + namePrefixes[randi_range(0,11)] + nameSuffixes[randi_range(0,11)]
