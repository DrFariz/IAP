extends ParallaxBackground

var background_width = 2048
func _ready():
	var screen_width = OS.window_size.x
	offset.x = screen_width / 2
