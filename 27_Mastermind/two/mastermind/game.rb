class Game
	attr_reader :game_name
	@@game_record = Hash.new
	def initialize name
		@game_name = name
		@round_num = 0
		@max_rounds = GenCons::MaxRounds
		@code_length = GenCons::CodeLength
		start_method = "player_setup"
		puts "Welcome to this game of Mastermind, #{name}! When you're ready to run the game, simply type '#{name}.#{start_method}'!"
		end
	
	def self.new_entry(user,role)
		@@game_record[user.to_sym] ||= {total: 0,wins: 0, total_as_breaker: 0, wins_as_breaker: 0, total_as_maker: 0,  wins_as_maker: 0}
		their_role = "total_as_#{role}".intern
		@@game_record[user.to_sym][their_role]+=1
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
		
				
	def player_setup
		@game_type = how_many_players
		player_uno = Player.new(@game_type)
		Game.new_entry(player_uno.user_name,player_uno.role)
		player_dos = Player.new(@game_type) if need_partner? game_type
		player_dos ||= Computer.new(Player.get_options)
		Game.new_entry(player_dos.user_name,player_dos.role)
#		if player_uno[:role]== GenCons::Breaker_title
		if player_uno.role == GenCons::Breaker_title
			codebreaker = player_uno
			codemaker = player_dos
			else
			codemaker = player_uno
			codebreaker = player_dos
			end
		game_record[player_uno.user_name.to_sym][:total]+=1
		game_record[player_two.user_name.to_sym][:total]+=1
		game_play(@code_length,@max_rounds,codebreaker,codemaker)
		end	
	
	def game_play(code_length, max_rounds, player_one, player_two, other_players*)
		player_one.intro(code_length,max_rounds)
		the_code = player_two.intro(code_length,max_rounds)
		while @round_num < @max_rounds+1
			guess = player_one.take_turn(@round_num,response)
			response = player_two.take_turn(@round_num, guess)
			game_over(player_one) if response == "2222" || guess == the_code
			@round_num+=1
			end
		game_over(player_two)
		end
	
	def game_over(victor)
		@@game_record[victor.user_name.to_sym][:wins]+=1
		@@game_record[victor.user_name.to_sym]["wins_as_#{victor.role}".intern]
		puts "\n--------------------\n\e[32mThe game is finished!! That's right, #{@game_name} is all over!\e[0m"
		puts "\e[1;33Our winner is #{victor}!!\e[0m]"
		puts "Congratulations!"
		puts @@game_record[victor.user_name.to_sym]
		puts "There are your stats! Good bye!"
		exit(0)
		end
	
	
	end



#Sources:
#http://ithaca.arpinum.org/2010/07/29/ruby-dynamic-includes.html
		