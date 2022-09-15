extends Node
signal gameover(winner)

var player_options = [
	"res://assets/tick.png",
	"res://assets/circle.png",
	"res://assets/cross.png"
]
var cells = []



func _ready():
	randomize()
	player_options.shuffle()
	for _i in range(9):
		cells.append(0)
	

func update(index: int, player: int):
	print(index)
	cells[index] = player
	var cell = get_child(index)
	var mark = Sprite.new()
	mark.offset = cell.rect_size / 2
	mark.texture = load(player_options[player])
	cell.add_child(mark)
	cell.disabled = true
	var winner = check_game_over()
	if winner != 0:
		emit_signal("gameover", winner)


func check_game_over():
	for i in range(3):
		# rows
		if cells[3*i] == cells[3*i+1] and cells[3*i] == cells[3*i+2]:
			if cells[i] != 0: # dont return if its not marked
				return cells[i]
		# cols
		if cells[i+3] == cells[i+4] and cells[i+3] == cells[i+5]:
			if cells[i+3] != 0: # same as above
				return cells[i+3]
				
	# main diagonal
	if cells[0] == cells[4] and cells[0] == cells[8]:
		if cells[0] != 0: # same as above
			return cells[0]
			
	# anti diagonal
	if cells[2] == cells[4] and cells[2] == cells[6]:
		return cells[2] # it okay to return 0 since its the last condition 
	return 0 # just to be safe



	
