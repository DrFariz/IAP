extends Camera2D

var is_dragging = false
var last_touch_position = Vector2()

func _input(event):
	# Menangani input touchscreen
	if event is InputEventScreenTouch:
		if event.pressed:
			is_dragging = true
			last_touch_position = event.position
			
		else:
			is_dragging = false

	elif event is InputEventScreenDrag and is_dragging:
		var delta = event.position - last_touch_position
		position -= delta  # Geser kamera berlawanan dengan gerakan drag
		last_touch_position = event.position
	
	var min_x = -10000  # Batas kiri
	var max_x = 10000  # Batas kanan (sesuaikan dengan ukuran level)
	var min_y = -773
	var max_y = 10000  # Batas bawah (sesuaikan dengan ukuran level)
	
	position.x = clamp(position.x, min_x, max_x)
	position.y = clamp(position.y, min_y, max_y)
