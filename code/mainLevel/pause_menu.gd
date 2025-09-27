extends Control

@onready var pauseOverlay = get_node("PauseOverlay")
var pressed = false
signal paused
signal unpaused

func _input(event):
	if event.is_action_pressed("pause"):
		pressed = !pressed
		if pressed == true:
			paused.emit()
			print("paused")
		else:
			unpaused.emit()
			print("unpaused")

func _process(_delta):
	if pressed == true:
		get_tree().paused = true
		self.show()
	else:
		get_tree().paused = false
		self.hide()
