module Mastermind
	class Game
		
		attr_reader :round_num :current_player
		
		def initialize(player)
			@player = player
			@rounds = 12
			