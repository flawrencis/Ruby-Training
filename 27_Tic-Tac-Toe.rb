#Revision 2(?)
#	Separated classes. #Now need to figure out how class variables work.

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
	
	sign_options = ["X", "O", "Z", "&", "#"]
	which = rand(1..5)
	first_sign = sign_options[which-1].pop
	which = rand(1..4)
	second_sign = sign_options[which-1]
	@signs_array = [first_sign,second_sign]
	
	end


class TicTacToe < Player
	include GameBoard
	attr_reader :games_played, :games_record, :current_players, :sign_hash, :start
	$games_record
	@@games_played
	def initialize
#		unless defined?($games_record)
#			$games_record = Hash.new
#			$games_record = $games_record
#			end
#		unless defined?($games_played)
#			$games_played=0
#			end
		$current_players= Array.new
#		@sign_hash = Hash.new
		@victory=false
		@moves=0
		game_intro(@@games_played)
		@board = board
		end
	
#	Needs to be called by user.
	def self.record_of_games
#		unless defined?(@@games_record)
#			@@games_record = Hash.new
#			end
		$games_record ||= Hash.new
		end
	
#	Needs to be called by user.	
	def self.count_of_total_games_played
#		unless defined?(@@games_played)
#			@@games_played=0
#			end
		@@games_played ||= 0
		end

	def game_intro(game_number)
		puts "\nWelcome to Game ##{game_number+1} of Francis's TicTacToe adventure!\n"
		puts "Now, you can decide to make_player or try to find yourself using 'Player.get(<Your Name>)'?"
		end

	
#	Needs to be called by user.
	def make_player
		puts "\nIf I may, master, what is your government name?"
		name_input = gets.chomp
#		@name_1 = name_input.split.map {|i| i.capitalize}.join(" ")
#		@user_name_1= new_name[0][(0..3)]+new_name[2][(0..3)]
		sign = @signs_array[0]
		Player.new(name_input,sign)
		$current_players[0] << @order[1]
		$current_players[0] << @signs_array[0]
		@signs_array = @signs_array.delete_at(0)
		puts "\nThank you!\tNow I just need the next person."
		
		puts "Other master, when ready, please type your government name."
		name_input = gets.chomp
		sign = @signs_array[-1]
		Player.new(name_input,sign)
		$current_players[1] << @order[0]
		$current_players[1] << @signs_array[-1]
		end
		
	
	def start
		a = $current_players[0][un:]
		b = $current_players[1][un:]
#		player_1 = @current_players[0]
#		player_2 = @current_players[1]
		puts "It looks like we have #{@player_1} vying against #{@player_a}!\n"
		start_game
		end
	
	def start_game
		start_time = Time.new
		$games_record["Game Data"]["Game #{@@games_played+1}"]={:start_time => start_time.strftime("%H:%M")}
		case $current_players[0][:order]
			when 0
			@first_player = $current_players[0][:un]
			@num = @moves
			when 1
			@first_player = $current_players[1][:un]
			@num = @moves + 1
			end
		game_process
		end
	


	def game_process
		puts @board
		current_player=@first_player
		while @victory == false
			take_turn(@moves,@num,@board)
			@moves+=1
			puts @board
			results = is_victory(@board,@moves)
			end
		end
	
	def is_victory(board,sign)
		n=board.index(sign)
		if (board[n]==board[n+3] && board[n+3]==board[n+6]) || (board[n]==board[n+8] && board[n+8]==board[n+16]) || (board[0]==board[11] && board[11]==board[22]) || (board[6]==board[11] && board[11]==board[16])
			@victory = true
			end
		winner_name = $games_record.key(sign)
		winning_user = $games_record[winner_name]
		winner_index = $current_players.index(winning_user)
		case winner_index
			when 1
			loser_index = 0
			when 0
			loser_index = 1
			end
		winning_id = $current_players[winner_index]
		losing_id = $current_players[loser_index]
		add_to_player_totals(winning_id,losing_id)
		return [winning_id,losing_id]
		end

	def end_of_game(results)
		winning_id = results[0]
		loser_id = results[1]
#		victor_id = $current_players[windex][1]
#		loser_id = $current_players[lodex][1]
		@@games_played+=1
		$games_record["Game Data"]["Game #{@@games_played}"]={:end_time => Time.now.strftime("%H:%M"), :total_time => "#{Time.now - start_time} secs", :loser => loser_id, :victor => victor_id}
		end
	end #class TicTacToe end



class Player
	include GameBoard
	attr_reader :get, :signs

	def initialize(name_input,sign)
		@name_input = name_input
		@sign = sign
		add_player(@name_input,@sign)
		unless defined?(@signs_array)
			Player.signs
			end
		unless defined?(@order_array)
			Player.order
			end
		end

	def add_player(name,sign)
		@name=name.split.map {|i| i.capitalize}.join(" ")
		new_name = @name.strip.downcase.scan(/\w*/)
		user_name= new_name[0][(0..3)]+new_name[2][(0..3)]
		unless $current_players.length > 2
			if defined?(@user_name)
				puts "Welcome back, #{@name}!"
				@player_id = $games_record[@name][:player_id]
				@user_name = $games_record[@name][:user_name]
				@total_score = $games_record[@name][:total_score]
				$current_players << {un: @user_name,id: @player_id,s: sign]
				else
				puts "I see you're a brand new addition! Welcome, #{@name}."
				@user_name = user_name
				@player_id = $current_players.length
				$current_players << {un: @user_name,id: @player_id,s: sign]
				add_new_player_to_record(@name)
				end
			end
		end

	def add_new_player_to_record(name)
		$games_record[name] = {:player_id => @player_id, :user_name => @user_name, :total_score => 0}
		end

	def self.get(input) #find yourself if you are already a saved user
		stop = false #Keep offering search opportunity until player stops.
		while stop == false
			if $games_record.include?(input)
				@player_id = $games_record[input][:player_id]
				@user_name = $games_record[input][:user_name]
				@total_score = $games_record[input][:total_score]
				puts "That is player ##{@player_id} aka #{@user_name}. Look out for when it's your turn."
				return
				end
			puts "What would you like to search instead? Or tell me to stop."
			stop=gets.chomp.strip.scan(/\S*\s*stop.*/i)
			end
		puts "Okay, then. Sorry!" 
		end
	
	def self.signs
		sign_options = ["X", "O", "Z", "&", "#"]
		which = rand(1..5)
		first_sign = sign_options[which-1].pop
		which = rand(1..4)
		second_sign = sign_options[which-1]
		@signs_array = [first_sign,second_sign]
		end
	
	def self.order
		ord = rand(1..2)
		ord -= 1
		orde = ord - 1
		@order = [ord, orde.abs]
		end
	
	def sign
		@sign = $current_players[}
		end
		

	def take_turn(moves,num,board)
		player = $current_players[num][:un]
		p "#{player}, #{moves+1}:"
		sign = $current_players[num][:sign]
		@last_move= gets.chomp.scan(/\W(\w)\W/)
		puts "You chose #{@last_move}..."
		@board.gsub!(@last_move,sign)
		num+=1
		current_player = $current_players[num%2][:un]
		end
	
	end #Player end





#Info
#1	either calling it normally using @age or calling the method on the instance 	using self,
#2	Dependency. I don't understand it.
#Sources
#1	http://www.eriktrautman.com/posts/ruby-explained-classes
#2	http://www.codequizzes.com/ruby/practical-object-oriented-design