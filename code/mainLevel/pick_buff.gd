extends Control

@onready var level = get_node('../../../Level')
@onready var pauseMenu = get_node('../../PauseMenu')
@onready var enemy = get_node('../../../Level/Enemy')
@onready var hud = get_node('../../HUD')
var buffSelectOne = 0
var buffSelectTwo = 0
var selecting = true
var maxHealth = 3

signal increaseDamageTaken

var buffList = ['Increase per wave big bullet allowance by two',
'Plus 0.5 bullet damage', 'Heal +1 health', 'Gain 2 extra max health']


func _ready():
	self.hide()


func _on_next_pressed() -> void:
	if level.wave % 5 == 0:
		self.show()
		reloadBuff()

func reloadBuff():
	buffSelectOne = randi_range(2,3)
	while selecting:
		buffSelectTwo = randi_range(2,3)
		if buffSelectTwo != buffSelectOne:
			selecting = false
	selecting = true
	$Buff1.text = buffList[buffSelectOne]
	$Buff2.text = buffList[buffSelectTwo]

func activateBuff(buffSelection):
	if buffSelection == 0:
		level.bigBulletRefill += 2
	if buffSelection == 1:
		increaseDamageTaken.emit()
	if buffSelection == 2:
		if maxHealth == 3 && hud.health <=2:
			hud.health += 1
		if maxHealth == 5 && hud.health <= 4:
			hud.health += 1
	if buffSelection == 3:
		if maxHealth == 3:
			maxHealth = 5
			hud.health = 5

func _on_buff_1_pressed() -> void:
	pauseMenu.pressed = false
	activateBuff(buffSelectOne)

func _on_buff_2_pressed() -> void:
	pauseMenu.pressed = false
	activateBuff(buffSelectTwo)
