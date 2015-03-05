module Mastermind
	class Game
		attr_reader :player_two, :player_one, :round_num, :max_rounds, :record
#		:breaker, :player_hash
		
		def initialize
#			@breaker = "c"
#			@maker = "m"
			puts "Welcome to your new game of Mastermind."
			who_is_playing
			@round_num = 0
			@max_rounds = 12
			@record = Hash.new
#			game_play
			end
		
		def who_is_playing
			puts "I need two players. Will the computer be your opponent? [y/n]"
			who_response = String.new
			gets.chomp.scan(/([y,n])(.*)/) {|x,b| who_response = x.to_s}
			player_hash = get_role_including_name_call
			player_initiation(player_hash)
			if who_response == "n"
				puts "\nThat was so nice. Now I have some questions for the 2nd player!"
				get_role_including_name_call(2)
#				puts "Gotta call already_decided.\n"
				already_decided(@player_one,@player_two)
#				puts "Thanks a_d, now two is #{@player_two}.\n"
				the_name = @player_two[:user_name]
				player_initiation(@player_two) 
				end
			end

		
		def player_initiation(hash)
			case hash[:role]
				when "MAKER"
				puts "Okay, maker! Let's get you started!\n"
				Codemaker.new(hash.values_at(:user_name,:real_name))
				when "BREAKER"
				puts "Okay, code-breaker! Let's get you setup!\n"
				Codebreaker.new(hash.values_at(:user_name,:real_name))
				end
			end
		
		def already_decided(first_hash,player_two)
#			puts "A_D, currently two is #{@player_two}.\n"
#			puts "\nMeanwhile, first_hash is #{first_hash}.\n"
			if first_hash[:role]== "BREAKER"
				@player_two[:role]= "MAKER"
#				puts "Made two's role MAKER. See? #{@player_two}.\n"
				else
				@player_two[:role]= "BREAKER"
#				puts "Made two's role BREAKER. See? #{@player_two}.\n"
				end
			end
			
		
		
		def get_role_including_name_call(num_players=1) #parameter for 2nd player
			puts "Hey, are you here to crack the code or make the code? [c/m]"
			role_response = String.new
			gets.chomp.scan(/([c,m])(.*)/) {|x,rest| role_response = x.to_s}
			if role_response == @breaker
				role = "BREAKER"
				elsif role_response == @maker
				role = "MAKER"
				end
				
			info = Array.new
			info = get_name
			info << role
			player_hash = {user_name: info[0], real_name: info[1], role: info[2]}
			if num_players == 2
				@player_two = player_hash
				else
				@player_one = player_hash
				end
			end
		
		def get_name
			puts "What's your name? Example: John Butt"
			name = gets.chomp
			real_name = name.split.map {|i| i.capitalize}.join(" ")
			new_name = real_name.strip.downcase.scan(/\w*/)
			user_name= new_name[2][(0..3)] + new_name[0][(0..3)]
			[user_name,real_name]
			end
		
		def game_play(round_num)
			while round_num <= 12
				guess = play_breaker(round_num,feedback=[])
				feedback = play_maker(round_num,guess)
				@record[round_num.to_sym] = [guess,feedback]
				return if victory_check(round_num,feedback)==true
				@round_num+=1
				end
			end_game
			end
		
		def victory_check(round_num,round_results)
			if round_results == "2222"
				result = true
				puts "\n\n\n\n\e[1;4;33mOH, \e[36mWOW\e[33m, YOU FIGURED IT OUT!!!! WAY TO GO!!!!\e[0m"
				puts "\nBig ups to #{Codebreaker.first_name}!!"
				puts "Guessing in #{round_num} rounds isn't shabby!"
				abort("Thanks for playing, folks! Bye!")
				end
			result
			end
		
		def end_game
			puts "\n\n\n\n********************************************" 
			puts "\n********************************************" 
			puts "\n\t\t\e[1;33mGAME OVER."
			puts "YOU ARE AN AMAZING ENCODER, #{Codemaker.real_name}!!!\e[0m"
			puts "............................................"
			puts "\e[36mSorry for your loss, #{Codebreaker.first_name}. It doesn't mean that #{Codemaker.real_name} is better than you; it only means #{Codemaker.first_name} is smarter than you.\e[0m"
			abort("\nThanks for playing, people! Have a good one!")
			end
		end
	end
				
		
		
#Sources
#http://stackoverflow.com/questions/29539/ruby-exit-message
#	return unless source
#	http://codereview.stackexchange.com/questions/59744/early-return-unless-return-value-is-nil