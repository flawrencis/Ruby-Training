#26/02 0925h CST Oh, this won't load because this is just a class in a method. I cannot instantiate from here.
module TicTacToe
	class Player
		attr_reader :color, :name
		def initialize(input)
			@color = input.fetch(:color)
			@name = input.fetch(:name)
			end
		end
	end