extends AudioStreamPlayer

@onready var player = get_node("../../MainMenu/Level/player2")

func _ready():
	if player:
		player.bigBulletShot.connect(onBigBulletShot)
		
func onBigBulletShot():
	play()
