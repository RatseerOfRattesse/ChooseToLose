extends Node

@onready var generic = get_node("Background/Generic")
@onready var lvl1 = get_node("Background/Lvl1")
@onready var mainMenu = get_node('MainMenu')

func _ready():
	#LOGGING
	print("STARTING")
	#LOAD SEQUENCE
	generic.show()
	
	lvl1.hide()
	
	mainMenu.hide()
