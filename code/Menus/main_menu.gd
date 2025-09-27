extends Node2D

@onready var something = get_node('Sprite2D')
@onready var StartText = get_node('../Background/StartText')
@onready var backButton = get_node('OptionsMenu/Back')

func _ready():
	if backButton:
		backButton.pressed.connect(on_back_pressed)

func _process(_delta):
	if StartText.done == true:
		self.show()

func _on_options_pressed() -> void:
	self.hide()
	
func on_back_pressed():
	self.show()
