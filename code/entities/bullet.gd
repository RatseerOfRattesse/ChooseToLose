extends Area2D

func _process(delta):
	move()

func move():
	for i in range(300):
		position += Vector2(1, 0)
		await get_tree().create_timer(0.01).timeout
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
