extends TextureRect

func _ready():
	if self.material:
		if self.material is ShaderMaterial:
			self.material.set_shader_parameter("enabled", true)

func _on_pause_menu_paused() -> void:
	self.material.set_shader_parameter("enabled", false)


func _on_pause_menu_unpaused() -> void:
	self.material.set_shader_parameter("enabled", true)
