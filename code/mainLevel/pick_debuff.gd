extends Control

@onready var level = get_node('../../../Level')
@onready var player = get_node('../../../Level/player2')
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
	level.wave += 1
	player.speed -= (player.speed/100) * 20

func _on_debuff_2_pressed() -> void:
	level.wave += 1
	enemySpeedBoost.emit()
