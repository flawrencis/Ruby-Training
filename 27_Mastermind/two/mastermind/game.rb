class Game
	attr_reader :game_name
	def initialize name
		@game_name = name
		start_method = "player_setup"
		puts "Welcome to this game of Mastermind, #{name}! When you're ready to run the game, simply type '#{name}.#{start_method}'!"
		end
	
	def player_setup
		@game_type = how_many_players
		player_uno = Player.new(@game_type)
		player_dos = Player.new(@game_type) if need_partner? game_type
		end
	
	def how_many_players
		puts "Yo man, are you playing against the computer? [y/n]"
		resp = gets.chomp.scan(/([y,n])(.*)/) {|x,b| who_response = x.to_s}
		return "hh" if x == "y"
		return "hc" if x == "n"
		end
	
	def need_partner? game_type
		return false if game_type.includes? "c"
		true
		end
		
		
	end


#Sources:
#http://ithaca.arpinum.org/2010/07/29/ruby-dynamic-includes.html
		