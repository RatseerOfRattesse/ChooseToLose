extends Control

@onready var player = get_node('../../../Level/player2')
@onready var pauseMenu = get_node('../../PauseMenu')
@onready var level = get_node('../../../Level')
const debuffList = [20, 10]
const debuffDescription = ['Decrease movement speed by 20%', 'Increase enemy movement speed by 10%', 'Increase enemies per wave by one']
var debuffSelectOne = 0
var debuffSelectTwo = 0
var selecting = true
signal enemySpeedBoost

func _ready():
	self.hide()
	print(level)

func _on_next_pressed() -> void:
	self.show()
	debuffSelectOne = randi_range(0,2)
	while selecting:
		debuffSelectTwo = randi_range(0,2)
		print(debuffSelectTwo)
		if debuffSelectTwo != debuffSelectOne:
			selecting = false
	selecting = true
	$Debuff1.text = debuffDescription[debuffSelectOne]
	$Debuff2.text = debuffDescription[debuffSelectTwo]

func _on_debuff_1_pressed() -> void:
	if debuffSelectOne == 0:
		player.speed -= (player.speed/100) * 20
	elif debuffSelectOne == 1:
		enemySpeedBoost.emit()
	elif debuffSelectOne == 2:
		level.buffEnemyCount()
		print(level.perWaveBuff)
	pauseMenu.pressed = false

func _on_debuff_2_pressed() -> void:
	if debuffSelectOne == 0:
		player.speed -= (player.speed/100) * 20
	elif debuffSelectOne == 1:
		enemySpeedBoost.emit()
	elif debuffSelectOne == 2:
		level.buffEnemyCount()
		print(level.perWaveBuff)
	pauseMenu.pressed = false
