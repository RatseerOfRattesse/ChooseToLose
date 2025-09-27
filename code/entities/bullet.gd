extends CharacterBody2D

func _process(delta):
	#for i in range(1000):
	#	position += Vector2(1, 0)
	#	await get_tree().create_timer(delta*0.01).timeout
	await get_tree().create_timer(3).timeout
	queue_free()
