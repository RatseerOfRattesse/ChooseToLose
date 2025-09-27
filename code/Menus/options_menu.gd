extends Node2D

@onready var optionsButton = get_node('../Options')
@onready var ingameOptionsButton = get_node('../Level/PauseMenu/Options')

func _ready():
	if optionsButton:
		optionsButton.pressed.connect(on_options_pressed)
		
	if ingameOptionsButton:
		ingameOptionsButton.pressed.connect(on_options_pressed)
		print(ingameOptionsButton)
		
func on_options_pressed():
	self.show()
	print("success")

func _on_back_pressed() -> void:
	self.hide()
