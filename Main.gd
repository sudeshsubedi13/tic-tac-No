extends Node


var player1
var player2
var current_player


func _ready():
	player1 = 1
	player2 = -1
	current_player = player1
	var cell_group = $Board.get_children()
	#print(cell_group)
	for i in cell_group:
		i.connect("cell_pressed", self, "_on_cell_pressed")


func _on_cell_pressed(index):
	$Board.update(index, current_player)
	current_player = player2 if current_player == player1 else player1


func _on_Board_gameover(winner):
	pass # Replace with function body.
