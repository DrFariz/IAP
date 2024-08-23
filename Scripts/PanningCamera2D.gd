extends Camera2D
class_name PanningCamera2D

var camera_min = -500.0
var camera_max = 10000.0
var _last_touch_pos: Vector2

func _physics_process(_delta) -> void:
	# Clamp posisi kamera agar tetap berada di dalam batas
	position.x = clamp(position.x, -100, 10000)

func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			_last_touch_pos = event.position
	elif event is InputEventScreenDrag:
		# Menggeser kamera dengan satu jari
		var delta = event.position - _last_touch_pos
		position -= delta * zoom
		_last_touch_pos = event.position

		# Batasi posisi kamera dengan clamping
		position.x = clamp(position.x, -100, 10000)
