extends AudioStreamPlayer

@onready var hud = get_node("../../MainMenu/Level/HUD")

func _ready():
	if hud:
		hud.damageTaken.connect(onDamageTaken)
		
func onDamageTaken():
	play()
