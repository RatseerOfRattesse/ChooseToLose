extends Label

@export var done = false
var charprinted = false
var StartText = ["THE YEAR IS 2050.", 
"MIRACULOUSLY, THE APOCALYPSE HASN'T HAPPENED YET.", 
"CORPORATIONS HAVE CONTINUED TO INSINUATE THEMSELVES \n INTO ALL ASPECTS OF REALITY.", 
"YOUR DREAMS ARE NEXT."]

var temp = 0

func _ready():
	start()

func _process(delta):
	if Input.is_action_just_pressed("ui_text_submit"):
		temp += 1

func start():
	visible_characters = 0
	for line in 4:
		visible_characters = 0
		print(StartText[line])
		text = StartText[line]
		for character in StartText[line].length():
			if temp == 0:
				visible_characters += 1
				await get_tree().create_timer(0.1).timeout
		temp = 0
		charprinted = true
	if charprinted == true:
		await get_tree().create_timer(2).timeout
		charprinted = false
	text = ""
	done = true
