extends Node

@onready var generic = get_node("Background/Generic")
@onready var lvl1 = get_node("Background/Lvl1")

func _ready():
	#LOGGING
	print("STARTING")
	#LOAD SEQUENCE
	generic.show()
	
	lvl1.hide()
