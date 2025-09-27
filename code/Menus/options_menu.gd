extends Node2D

@onready var optionsButton = get_node('../Options')

func _ready():
	if optionsButton:
		optionsButton.pressed.connect(on_options_pressed)
		
func on_options_pressed():
	self.show()

func _on_back_pressed() -> void:
	self.hide()
