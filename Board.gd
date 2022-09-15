extends Node
signal gameover(winner)

var player_options = [
	"res://assets/tick.png",
	"res://assets/circle.png",
	"res://assets/cross.png"
]
var cells = []
var no_of_marks = 0


func init_board():
	no_of_marks = 0
	cells.resize(9)
	randomize()
	player_options.shuffle()
	for i in range(9):
		cells[i] = 0
	

func update(index: int, player: int):
	print(index)
	no_of_marks += 1
	var rand_opts = []
	for i in range(9):
		if i != index and cells[i] == 0:
			rand_opts.append(i)
	randomize()
	index = rand_opts[randi() % rand_opts.size()]
	cells[index] = player
	var cell = get_child(index)
	var mark = Sprite.new()
	mark.offset = cell.rect_size / 2
	mark.texture = load(player_options[player])
	cell.add_child(mark)
	cell.disabled = true
	var winner = check_game_over()
	if winner != 0:
		print(cells)
		emit_signal("gameover", winner)
		return
	if no_of_marks >= 9: # no more cells left
		emit_signal("gameover", 0) # draw


func check_game_over():
	if no_of_marks < 5:
		return 0
	print("test0")
	for i in range(3):
		# rows
		if cells[3*i] == cells[3*i+1] and cells[3*i] == cells[3*i+2]:
			if cells[3*i] != 0: # dont return if its not marked
				print(i, "test1")
				return cells[i]
		# cols
		if cells[i] == cells[i+3] and cells[i] == cells[i+6]:
			if cells[i] != 0: # same as above
				print("test2")
				return cells[i+3]
				
	# main diagonal
	if cells[0] == cells[4] and cells[0] == cells[8]:
		if cells[0] != 0: # same as above
			print("test3")
			return cells[0]
			
	# anti diagonal
	if cells[2] == cells[4] and cells[2] == cells[6]:
		print("test4")
		return cells[2] # it okay to return 0 since its the last condition 
	return 0 # just to be safe



	
