extends AudioStreamPlayer

@onready var pickBuff = get_node("../../MainMenu/Level/HUD/pickBuff")

func _ready():
	if pickBuff:
		pickBuff.buffReceived.connect(onBuffReceived)
		
func onBuffReceived():
	play()
