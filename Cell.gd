extends TextureButton

signal cell_pressed(index)


func _ready():
	rect_size = get_viewport_rect().size / 3


func _on_Cell_pressed():
	var mouse_pos = get_global_mouse_position()
	# get index of cell pressed from mouse position
	var index = int(mouse_pos.y / rect_size.y) * 3 + int(mouse_pos.x / rect_size.x)
	emit_signal("cell_pressed", index)
	
