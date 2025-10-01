extends Control

@onready var level = get_node('../../../Level')
@onready var pauseMenu = get_node('../../PauseMenu')
var buffSelectOne = 0
var buffSelectTwo = 0
var selecting = true

var buffList = ['Increase per wave big bullet allowance by two',
'This is also one of the buff options']


func _ready():
	self.hide()
	print(level)


func _on_next_pressed() -> void:
	if level.wave % 5 == 0:
		self.show()
		reloadBuff()

func reloadBuff():
	buffSelectOne = randi_range(0,1)
	while selecting:
		buffSelectTwo = randi_range(0,1)
		if buffSelectTwo != buffSelectOne:
			selecting = false
	selecting = true
	$Buff1.text = buffList[buffSelectOne]
	$Buff2.text = buffList[buffSelectTwo]

func activateBuff(buffSelection):
	if buffSelection == 0:
		level.bigBulletRefill += 2
	if buffSelection == 1:
		pass

func _on_buff_1_pressed() -> void:
	pauseMenu.pressed = false
	activateBuff(buffSelectOne)

func _on_buff_2_pressed() -> void:
	pauseMenu.pressed = false
	activateBuff(buffSelectTwo)
