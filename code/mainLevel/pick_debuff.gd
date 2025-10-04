extends Control

@onready var player = get_node('../../../Level/player2')
@onready var pauseMenu = get_node('../../PauseMenu')
@onready var level = get_node('../../../Level')
@onready var catjam = get_node('../../Catjam')
@onready var enemy = get_node('../../../Level/Enemy')
@onready var music = get_node('../../../../Music')
const debuffDescription = ['Decrease movement speed by 20%', 
'Increase enemy movement speed by 10%', 
'Increase enemies per wave by one',
'Enemies spawn closer',
'Enemies are 20% smaller',
'Plus one enemy health',
'Mystery!',
'Decrease bullet speed',
'You thought the music option was useless didn\'t you?',
'Invert your controls at random intervals',
'Cover half your screen with a cat',
]
var debuffSelectOne = 0
var debuffSelectTwo = 0
var selecting = true
var catjamOn = false
signal enemySpeedBoost
var musicOn = false
var tomFoolery = false
var invert = false
signal timeToInvert

func _ready():
	self.hide()

func _process(_delta):
	if invert == true:
		player.invertControls = -1
	else:
		player.invertControls = 1

func _on_next_pressed() -> void:
	if level.wave % 5 != 0:
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
		if musicOn == false:
			musicOn = true
			music.playing = true
	elif debuffSelect == 9:
		goofyControls()
	elif debuffSelect == 10:
		catjam.show()
		catjam.play("default")
		catjamOn = true

func reloadDebuff():
	if catjamOn == false:
		debuffSelectOne = randi_range(0,10)
	else:
		debuffSelectOne = randi_range(0,9)
	while selecting:
		if catjamOn == false:
			debuffSelectTwo = randi_range(0,10)
		else:
			debuffSelectTwo = randi_range(0,9)
		if debuffSelectTwo != debuffSelectOne:
			selecting = false
	selecting = true
	$Debuff1.text = debuffDescription[debuffSelectOne]
	$Debuff2.text = debuffDescription[debuffSelectTwo]

func goofyControls():
	if tomFoolery == true:
		tomFoolery = false
	else:
		tomFoolery = true
	while tomFoolery:
		while true:
			invert = !invert
			timeToInvert.emit()
			await get_tree().create_timer(randi_range(4,10)).timeout
