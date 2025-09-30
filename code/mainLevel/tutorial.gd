extends Label

var done = false
@onready var startButton = get_node('../../../MainMenu/Button')
@onready var level = get_node('../../Level')
var printedchars = 0
var StartText = ["", 
"PRESS [ENTER] FOR NEXT LINE", 
"[WASD] OR [ARROW KEYS] TO MOVE", 
"[LEFT CLICK] TO SHOOT",
"[SPACE] to fire a piercing shot, you get two uses per wave",
"DEFEND YOUR BRAIN FROM THE NEW CUTTING-EDGE DREAM ADS \n(PATENT PENDING)",
"LOSE ALL 3 LIVES, YOU WILL BE UNDER CORPORATE INFLUENCE."]

var temp = 0

func _ready():
	if startButton:
		startButton.pressed.connect(on_start_pressed)

func on_start_pressed():
	type(StartText)

func _process(_delta):
	if Input.is_action_just_pressed("ui_text_submit"):
		temp += 1

func type(array):
	visible_characters = 0
	for line in array.size():
		visible_characters = 0
		text = array[line]
		for character in array[line].length():
			if temp == 0:
				visible_characters += 1
				await get_tree().create_timer(0.1).timeout
				printedchars += 1
		temp = 0
		if printedchars == array[line].length():
			await get_tree().create_timer(2).timeout
	text = ""
	done = true
	await get_tree().create_timer(2).timeout
	level.wave += 1
	level.ingame = true
