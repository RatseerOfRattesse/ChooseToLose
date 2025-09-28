extends Area2D

func _process(_delta):
	move()
	if not $VisibleOnScreenNotifier2D.is_on_screen():
		print("true")
		queue_free()

func move():
	for i in range(34):
		position += Vector2(1, 0)
		await get_tree().create_timer(0.03).timeout
	queue_free()

func _on_area_2d_area_entered(_area: Area2D) -> void:
	queue_free()
