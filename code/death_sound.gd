extends AudioStreamPlayer

@onready var hud = get_node("../../MainMenu/Level/HUD")

func _ready():
	if hud:
		hud.died.connect(onBuffReceived)
		
func onBuffReceived():
	play()
