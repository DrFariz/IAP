extends ParallaxLayer

var sprite_width = 0

func _ready():
    sprite_width = $Sprite.texture.get_width()
    var screen_width = OS.window_size.x
    mirroring.x = sprite_width
    offset.x = -screen_width / 2