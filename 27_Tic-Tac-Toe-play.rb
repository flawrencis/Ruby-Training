tic_tac_toe_game = TicTacToe.new
#What will it return?
a=Player.new("Francis")
#Return player number and symbol
b=Player.new("John")
#Return player number and symbol
#Can you change your name or symbol?
#	Let's wait on that.

#Puts "are you ready?"
"Yes" #Response just needs to start with a "y"

#Show game board with numbers in each square. 
#Which player
> number

#Show game board with new move.
#Which player

#Loop until either every X is in a different row and column or every x is in the same column or every x is in the same row.
#Have a hash with two keys- :row and :column. The corresponding values are two arrays. [1, 2, 3] so if :row[0] != (:row[1] || :row[2]) then game_over(player_number)

#original name typed should also be saved. And username. So that you can find yourself and play as yourself. There could be a Player.get function that takes name and returns player #.