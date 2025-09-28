extends Control

@onready var player = get_node('../../../Level/player2')
@onready var pauseMenu = get_node('../../PauseMenu')
const debuffList = [20, 10]
const debuffDescription = ['Decrease movement speed by 20%', 'Increase enemy movement speed by 10%']
var debuffSelect = 0
signal enemySpeedBoost

func _ready():
	self.hide()

func _on_next_pressed() -> void:
	self.show()
	$Debuff1.text = debuffDescription[0]
	$Debuff2.text = debuffDescription[1]

func _on_debuff_1_pressed() -> void:
	player.speed -= (player.speed/100) * 20
	pauseMenu.pressed = false

func _on_debuff_2_pressed() -> void:
	enemySpeedBoost.emit()
	pauseMenu.pressed = false
