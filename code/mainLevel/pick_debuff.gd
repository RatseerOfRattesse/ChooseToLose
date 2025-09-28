extends Control

@onready var wave = get_node('res://code/mainLevel/level.tscn')

func _ready():
	self.hide()

func _on_next_pressed() -> void:
	self.show()


func _on_debuff_1_pressed() -> void:
	wave.wave += 1


func _on_debuff_2_pressed() -> void:
	wave.wave += 1
