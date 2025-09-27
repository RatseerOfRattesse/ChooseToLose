extends Label

@onready var level = get_node('../../../../Level')

func _process(_delta):
	text = "WAVE: " + str(level.wave)
