extends Node2D

var ingame = false
@onready var startButton = get_node('../../MainMenu/Button')

func _ready():
	if startButton:
		startButton.pressed.connect(on_start_pressed)
		
func on_start_pressed():
	self.show()
	ingame = true
