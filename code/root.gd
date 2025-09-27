extends Node

@onready var generic = get_node("Background/Generic")
@onready var lvl1 = get_node("MainMenu/Level")
@onready var mainMenu = get_node('MainMenu')
@onready var optionsMenu = get_node('MainMenu/OptionsMenu')
@onready var ingameQuitButton = get_node('MainMenu/Level/PauseMenu/Quit')
@onready var quitButton = get_node('MainMenu/Quit')

func _ready():
	#LOGGING
	print("STARTING")
	#LOAD SEQUENCE
	generic.show()
	
	lvl1.hide()
	
	mainMenu.hide()

	optionsMenu.hide()
	
	if quitButton:
		quitButton.pressed.connect(on_quit_pressed)
		
	if ingameQuitButton:
		ingameQuitButton.pressed.connect(on_quit_pressed)
		
func on_quit_pressed():
	get_tree().quit()
