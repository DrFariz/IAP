extends TileMap

func _ready():
	var tile_width = 16
	var tile_height = 16
	
	var screen_width = OS.window_size.x
	var screen_height = OS.window_size.y +16
	
	var num_tiles_x = ceil(screen_width / tile_width)
	var num_tiles_y = ceil(screen_height / tile_height)
	
	# Posisi y dari mana ground dimulai
	var start_y = num_tiles_y - 7 # Sesuaikan dengan posisi awal ground dalam grid TileMap

	# Isi TileMap dengan Autotile dari start_y hingga ke bawah
	for x in range(num_tiles_x):
		for y in range(start_y, num_tiles_y):
			set_cell(x, y, 2)  # 0 adalah ID Autotile di TileSet

	# Perbarui bitmask untuk seluruh area yang baru saja diisi
	update_bitmask_region(Vector2(0, start_y), Vector2(num_tiles_x, num_tiles_y))
