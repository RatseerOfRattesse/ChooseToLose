extends Control

@onready var player = get_node('../../../Level/player2')
@onready var pauseMenu = get_node('../../PauseMenu')
@onready var level = get_node('../../../Level')
@onready var catjam = get_node('../../Catjam')
@onready var enemy = get_node('../../../Level/Enemy')
const debuffDescription = ['Decrease movement speed by 20%', 
'Increase enemy movement speed by 10%', 
'Increase enemies per wave by one',
'Enemies spawn closer',
'Enemies are 20% smaller',
'Plus one enemy health',
'Mystery!',
'Decrease bullet speed',
'Cover half your screen with a cat',
]
var debuffSelectOne = 0
var debuffSelectTwo = 0
var selecting = true
var catjamOn = false
signal enemySpeedBoost

func _ready():
	self.hide()
	print(enemy)

func _on_next_pressed() -> void:
	self.show()
	reloadDebuff()

func _on_debuff_1_pressed() -> void:
	getDebuffFunction(debuffSelectOne)
	pauseMenu.pressed = false

func _on_debuff_2_pressed() -> void:
	getDebuffFunction(debuffSelectTwo)
	pauseMenu.pressed = false
	
func getDebuffFunction(debuffSelect):
	if debuffSelect == 0:
		player.speed -= (player.speed/100) * 20
	elif debuffSelect == 1:
		enemySpeedBoost.emit()
	elif debuffSelect == 2:
		level.buffEnemyCount()
	elif debuffSelect == 3:
		level.enemySpawnXBottom -= 50
		level.enemySpawnXBottom -= 50
	elif debuffSelect == 4:
		level.changeEnemyScale()
	elif debuffSelect == 5:
		level.changeDT()
	elif debuffSelect == 6:
		pass
	elif debuffSelect == 7:
		player.decreaseBulletSpeed()
	elif debuffSelect == 8:
		catjam.show()
		catjam.play("default")
		catjamOn = true

func reloadDebuff():
	if catjamOn == false:
		debuffSelectOne = randi_range(0,8)
	else:
		debuffSelectOne = randi_range(0,7)
	while selecting:
		if catjamOn == false:
			debuffSelectTwo = randi_range(0,8)
		else:
			debuffSelectTwo = randi_range(0,7)
		if debuffSelectTwo != debuffSelectOne:
			selecting = false
	selecting = true
	$Debuff1.text = debuffDescription[debuffSelectOne]
	$Debuff2.text = debuffDescription[debuffSelectTwo]
