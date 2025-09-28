extends Control

@onready var pauseOverlay = get_node("PauseOverlay")
var pressed = false
var nextWave = false
signal paused
signal unpaused

func _input(event):
	if event.is_action_pressed("pause"):
		pressed = !pressed
		if pressed == true:
			paused.emit()
		else:
			unpaused.emit()

func _process(_delta):
	if pressed == true:
		get_tree().paused = true
		if nextWave == false:
			self.show()
	else:
		get_tree().paused = false
		if nextWave == false:
			self.hide()


func _on_hud_next_wave() -> void:
	nextWave = true
