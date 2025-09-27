extends Label

@onready var StartText = get_node("../StartText")
	
func _process(delta):
	if StartText.done == true:
		text = ''
	else:
		text = 'press [ENTER] if no attention span'
