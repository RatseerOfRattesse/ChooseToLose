extends Node2D

@onready var something = get_node('Sprite2D')
@onready var StartText = get_node('../Background/StartText')

func _process(delta):
	if StartText.done == true:
		self.show()
