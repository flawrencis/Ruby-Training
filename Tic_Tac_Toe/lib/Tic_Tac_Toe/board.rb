module TicTacToe
	class Board
		attr_reader :grid
		def initialize(input={})
			@grid = input.fetch(:grid, default_grid)
			end
		def get_cell(x,y)
			grid[y][x]
			end
		def set_cell(x,y,value)
			get_cell(x,y).value = value
			end
		def game_over
			return :winner if winner?
			return :draw if draw?
			false
			end
		
		private
		
		def default_grid
			Array.new(3) {Array.new(3) {Cell.new}}
			end
		end
	end




# A nested data structure also provides a convenient coordinate system to access elements of the array. Coordinate systems are usually stated in (x, y) and have an origin in the lower left corner. The nested array coordinate system has an origin in the upper left corner and is stated in (y, x). To access the “1” element in the example_array above, we use this code: example_array[2][2]. Make sure to play with the nested array structure in your console until you understand it.
#The game_over method relies on winner? and draw? predicate methods that will be private. Predicate methods are methods that return either true or false.