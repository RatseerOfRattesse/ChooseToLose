extends Node2D

signal buttonPressed
@onready var start = get_node('../../MainMenu/Button')
@onready var options = get_node('../../MainMenu/Options')
@onready var quitMainMenu = get_node('../../MainMenu/Quit')
@onready var back = get_node('../../MainMenu/OptionsMenu/Back')
@onready var quitPauseMenu = get_node('../../MainMenu/Level/PauseMenu/Quit')
@onready var quitDeathScreen = get_node('../../MainMenu/Level/HUD/DeathScreen/Quit')
@onready var debuff1 = get_node('../../MainMenu/Level/HUD/PickDebuff/Debuff1')
@onready var debuff2 = get_node('../../MainMenu/Level/HUD/PickDebuff/Debuff2')
@onready var buff1 = get_node('../../MainMenu/Level/HUD/pickBuff/Buff1')
@onready var buff2 = get_node('../../MainMenu/Level/HUD/pickBuff/Buff2')
@onready var next = get_node('../../MainMenu/Level/HUD/WinScreen/Next')
@onready var buttonList = [start, options, quitMainMenu, back, quitPauseMenu, quitDeathScreen, debuff1, debuff2, buff1, buff2, next]

func _ready():
	registerButtons()

func registerButtons():
	for button in buttonList:
		if button:
			button.pressed.connect(on_button_pressed)

func on_button_pressed():
	buttonPressed.emit()
