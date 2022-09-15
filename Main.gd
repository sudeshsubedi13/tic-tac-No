extends Node



var player1
var player2
var current_player
var cell = preload("res://Cell.tscn")

func _ready():
	player1 = 1
	player2 = -1


func newgame():
	get_tree().call_group("cells", "queue_free")
	current_player = player1
	$Board.init_board()
	for j in range(3):
		for i in range(3):
			var cell_instance = cell.instance()
			cell_instance.connect("cell_pressed", self, "_on_cell_pressed")
			cell_instance.rect_position.x = i * cell_instance.rect_size.x
			cell_instance.rect_position.y = j * cell_instance.rect_size.y
			$Board.add_child(cell_instance)
	$HUD.show_message("")

func _on_cell_pressed(index):
	$Board.update(index, current_player)
	current_player = player2 if current_player == player1 else player1


func _on_Board_gameover(winner):
	print(winner)
	$HUD.show_game_over(winner)
