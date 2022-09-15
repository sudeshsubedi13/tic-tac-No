extends CanvasLayer

signal start_game

func show_message(text):
		$Message.text = text
		$Message.show()
		$MessageTimer.start()

func show_game_over(winner):
	var message
	if winner == 1:
		message = "Player 1 won!!"
	elif winner == -1:
		message = "Player 2 won!!"
	else:
		message = "Draw"
	show_message(message)

	yield($MessageTimer, "timeout")

	$Message.text = "Tic-Tac-NO!!"
	$Message.show()

	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()



func _on_StartButton_pressed():
		$StartButton.hide()
		$ColorRect.hide()
		emit_signal("start_game")


func _on_MessageTimer_timeout():
		$Message.hide()
