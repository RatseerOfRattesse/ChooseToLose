extends Node

@onready var generic = get_node("Background/Generic")
@onready var lvl1 = get_node("MainMenu/Level")
@onready var mainMenu = get_node('MainMenu')
@onready var optionsMenu = get_node('MainMenu/OptionsMenu')
@onready var ingameQuitButton = get_node('MainMenu/Level/PauseMenu/Quit')
@onready var deathQuitButton = get_node('MainMenu/Level/HUD/DeathScreen/Quit')
@onready var deathScreen = get_node('MainMenu/Level/HUD/DeathScreen')
@onready var winScreen = get_node('MainMenu/Level/HUD/WinScreen')
@onready var quitButton = get_node('MainMenu/Quit')

func _ready():
	#LOGGING
	#LOAD SEQUENCE
	generic.show()
	
	lvl1.hide()
	
	mainMenu.hide()

	optionsMenu.hide()
	
	deathScreen.hide()
	
	winScreen.hide()
	
	if quitButton:
		quitButton.pressed.connect(on_quit_pressed)
		
	if ingameQuitButton:
		ingameQuitButton.pressed.connect(on_quit_pressed)
		
	if deathQuitButton:
		deathQuitButton.pressed.connect(on_quit_pressed)
		
func on_quit_pressed():
	get_tree().quit()
