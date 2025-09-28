extends Area2D

func _process(_delta):
	move()

func move():
	for i in range(300):
		position += Vector2(1, 0)
		await get_tree().create_timer(0.01).timeout
	queue_free()
