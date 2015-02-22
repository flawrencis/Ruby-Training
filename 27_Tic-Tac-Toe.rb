class TicTacToe
	attr_reader :players, :games_played
	def initialize
		if defined?(@@games_played)
			@@games_played += 1
			else
			@@games_played=0
			end
		game_intro(games_played)
		game_instructions(assignments[:names])
		end
	
	#Actually, I want to keep track of every player and score...
	
	def game_intro(games)
		puts "Welcome to Game ##{games_played-1} of Francis's TicTacToe adventure!!\n"
		puts "\nWhat shall I engrave on your crown, you great contender?"
#		@name = Array.new
		@name[0] = gets.scan(/\w{6}/i).join
#		puts "\nThank you! I am recording your name as #{name[0]}!"
		puts "\nThank you! I am recording your name as #{username_1}!"
		puts "\nNow, I have a question for your friend..."
		puts "\nWhat is your name, oh glorious challenger?!"
		@name[1] = gets.scan(/\w{6}/i).join
#		puts "\nThank you! I am recording your name as #{name[1]}!"
		puts "\nThank you! I am recording your name as #{username_2}!"
		end

	def player_assignments(name)
		@assignments = {
			:names => {
				:player_1 => username_1,
				:player_2 => username_2}
			:signs => {
				:player_1 => "X",
				:player_2 => "Y"}
			:order => {
				:player_1 => 1,
				:player_2 => 2}}
		end
	
	def game_instructions(assignments[:names])
		puts "Welcome, #{(assignments[:names][:player_1])} and #{(assignments[:names][:player_1])}. Player 1 you are "
	
	class Player
		def initialize(name)
			@name= :name

			end

		def player_symbol

		def who_first
