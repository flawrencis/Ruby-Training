#First, had to delete @ signs in front of arguments in two functions. "Formal arguments cannot be instance variables.
#Had to rename a couple variables that weren't consistent.
#Bad syntax on module requirement
#Should have actually used include

#How come I can access "games_played" but not "on_duty"?

#Why does it keep telling me that I have an unitialized constant Player?

#When can @ be passed around??

module GameBoard
	board = "a  b  c\nd  e  f\ng  h  i"
	a = board[0]
	b = board[3]
	c = board[6]
	
	d = board[8]
	e = board[11]
	f = board[14]
	
	g = board[16]
	h = board[19]
	i = board[22]
	end


class TicTacToe
	include GameBoard
#	attr_reader :on_duty
	attr_reader :games_played
	
	def initialize
		unless defined?(@@games_record)
			$games_record = Hash.new
			@@games_record = $games_record
			end
		unless defined?($games_played)
			$games_played=0
			end
		$current_players= Array.new
		$sign_hash = Hash.new
		$victory=false
		$moves=0
#		unless defined?(@@on_duty)
#			@@on_duty = 0
#			end
		game_intro(@@games_played)
		
		end
	
#	if @@on_duty == "yo"
#		attr_accessor :games_played
#		end
	
	class Player
		
		def initialize(name_input)
			@name_input = name_input
			add_player(name_input)
			end
		
		
		def add_player(name)
			@name=name.split.map {|i| i.capitalize}.join(" ")
			new_name = @name.strip.downcase.scan(/\w*/)
			@user_name= new_name[0][(0..3)]+new_name[2][(0..3)]
			unless $current_players.length > 2
				if defined?(@user_name)
					puts "Welcome back, #{@name}!"
					@player_id = @@games_record[@name][:player_id]
					@user_name = @@games_record[@name][:user_name]
					@total_score = @@games_record[@name][:total_score]
					@current_players << @user_name
					else
					puts "I see you're a brand new addition! Welcome, #{@name}."
					@current_players << @user_name
					@player_id = @@players.length
					add_new_player_to_record(@name)
					end
				end
			end
		
		def add_new_player_to_record(name)
			@@games_record[name] = {:player_id => @player_id, :user_name => @user_name, :total_score => 0}
			end
		
		def self.get(input) #find yourself if you are already a saved user
			stop = false #Keep offering search opportunity until player stops.
			while stop == false
				if @@games_record.include?(input)
					@player_id = @@games_record[input][:player_id]
					@user_name = @@games_record[input][:user_name]
					@total_score = @@games_record[input][:total_score]
					break
					end
				puts "What would you like to search instead? Or tell me to stop."
				stop=gets.chomp.strip.scan(/\S*\s*stop.*/i)
				end
			puts "Okay, then. That is player ##{@player_id} aka #{@user_name}."
			end
		
		def take_turn(moves,board)
			p "#{@current_player}, #{moves+1}:"
			@sign = @sign_hash[@current_player]
			@last_move= gets.chomp.scan(/\W(\w)\W/)
			puts "You chose #{@last_move}..."
			@board.gsub!(@last_move,@sign)
			is_victory(@board,@sign)
			play_mod_number+=1
			@current_player = @current_players[(play_mod_number%2)]
			end
			
		def is_victory(board,sign)
			n=board.index(sign)
			if (board[n]==board[n+3] && board[n+3]==board[n+6]) || (board[n]==board[n+8] && board[n+8]==board[n+16]) || (board[0]==board[11] && board[11]==board[22]) || (board[6]==board[11] && board[11]==board[16])
				@victory = true
				end
			end
		end #Player end
	
	def the_game
		puts @board
		@game_over=false
		while @game_over==false
			take_turn(@moves,@board)
			@moves+=1
			puts @board
			@game_over==true if @victory == true
			end
		end
	
	
	def game_intro(game_number)
		puts "\nWelcome to Game ##{game_number+1} of Francis's TicTacToe adventure!\n"
		end
	
	def start
		player_1 = @current_players[0]
		player_2 = @current_players[1]
		puts "It looks like we have #{player_1} vying against #{player_2}!\n"
		start_game
		end
	
	def start_game
		start_time = Time.new
		@@games_record["Game Data"]["Game #{@@games_played+1}"]={:start_time => start_time.strftime("%H:%M")}
		the_game
		end
	
	def end_of_game(loser_id,victor_id)
		@@games_played+=1
		@@games_record["Game Data"]["Game #{@@games_played}"]={:end_time => Time.now.strftime("%H:%M"), :total_time => "#{Time.now - start_time} secs", :loser => loser_id, :victor => victor_id}
		end
	
	end
	

#class TicTacToe
#	attr_reader :players, :games_played
#	def initialize
#		if defined?(@@games_played)
#			@@games_played += 1
#			else
#			@@games_played=0
#			end
#		game_intro(games_played)
#		game_instructions(assignments[:names])
#		end
#	
#	#Actually, I want to keep track of every player and score...
#	
#	def game_intro(games)
#		puts "Welcome to Game ##{games+1} of Francis's TicTacToe adventure!\n"
#		puts "\nWhat shall I engrave on your crown, you great contender?"
##		@name = Array.new
##		@name[0] = gets.scan(/\w{6}/i).join
#		@name[0] = gets.scan(/\w{6}/i).join
##		puts "\nThank you! I am recording your name as #{name[0]}!"
#		puts "\nThank you! I am recording your name as #{username_1}!"
#		puts "\nNow, I have a question for your friend..."
#		puts "\nWhat is your name, oh glorious challenger?!"
#		@name[1] = gets.scan(/\w{6}/i).join
##		puts "\nThank you! I am recording your name as #{name[1]}!"
#		puts "\nThank you! I am recording your name as #{username_2}!"
#		end
#
#	def player_assignments(name)
#		@assignments = {
#			:names => {
#				:player_1 => username_1,
#				:player_2 => username_2}
#			:signs => {
#				:player_1 => "X",
#				:player_2 => "Y"}
#			:order => {
#				:player_1 => 1,
#				:player_2 => 2}}
#		end
#	
#	def game_instructions(assignments[:names])
#		puts "Welcome, #{(assignments[:names][:player_1])} and #{(assignments[:names][:player_1])}. Player 1 you are "
#	
#	class Player
#		def initialize(name)
#			@name= :name
#
#			end
#
#		def player_symbol
#
#		def who_first
