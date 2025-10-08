extends Node2D

@onready var something = get_node('Sprite2D')
@onready var StartText = get_node('../Background/StartText')
@onready var backButton = get_node('OptionsMenu/Back')
@onready var bossRoom = get_node('BossAttackRoom')
@onready var sprite = $Sprite2D
@onready var label = $Label
@onready var button = $Button
@onready var options = $Options
@onready var credit  = $Credit
@onready var optionMenu = $OptionsMenu
@onready var quit = $Quit

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

func _on_button_pressed() -> void:
	self.hide()

func doPhaseTwo():
	bossRoom.show()
	self.hide()
	sprite.visible = false
	label.visible = false
	button.visible = false
	options.visible = false
	credit.visible = false
	optionMenu.visible = false
	quit.visible = false
