class Game
	attr_reader :game_name
	def initialize name
		@game_name = name
		start_method = "start"
		puts "Welcome to this game of Mastermind, #{name}! When you're ready to run the game, simply type '#{name}.#{start_method}'!"
		end
	
	def start
		@game_type = how_many_players
		Player.new(@game_type)
		self.class.send(:include, Codemaker)
		end
	
	def how_many_players
		puts "Yo man, are you playing against the computer? [y/n]"
		resp = gets.chomp.scan(/([y,n])(.*)/) {|x,b| who_response = x.to_s}
		return "hh" if x == "y"
		return "hc" if x == "n"
		end
		@player_a = Player.new
	end


#Sources:
#http://ithaca.arpinum.org/2010/07/29/ruby-dynamic-includes.html
		